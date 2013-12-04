class VacationConsultant < ActiveRecord::Base
  has_many :vc_assignments
  has_many :consultant_customer_destinations
  has_many :testimonials
  has_many :campaigns
  has_attached_file :profile_picture, styles: {
    profile: '150x180#',
    large: '500x500>'}, :processors => [:cropper]
  serialize :preferred_locations
  has_and_belongs_to_many :destinations
  belongs_to :user, :autosave => true
  attr_accessor :status, :crop_x, :crop_y, :crop_h, :crop_w
  validates_presence_of ["name", "address_1", "city", "state", "country", "mphone", "email", "preferred_neighborhood", "preferred_locations"]
  validate :check_mobile_no
 # after_save :commit_sunspot
  after_save :create_destinations_vc_mapping
  after_update :reprocess_profile_picture, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def profile_picture_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(profile_picture.url(style))
  end

  def commit_sunspot
    self.index! if self.changed?
  end

  def check_mobile_no
    if mphone.nil? || mphone.length != 10 || (mphone.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil)
      errors.add(:mphone, "invalid")
    end
  end
  searchable do
    text :name, :boost => 2.0
    text :email
    text :destinations do
      consultant_customer_destinations.map do |hsh|
        hsh.cust_iti_header.cust_iti_details.map do |h|
          h.destination.name rescue ''
        end
      end
    end
    string :class_name do
      self.class.name
    end
    text :poa do
      consultant_customer_destinations.map do |hsh|
        hsh.cust_iti_header.cust_iti_details.map do |h|
          h.destination.points_of_attractions.map {|poa| poa.name rescue ''}
        end
      end
    end
  end

  def self.search_me(query, page)
    VacationConsultant.search do
      fulltext query
    end
  end

  def self.build_from_vc_reg(vc_reg)
    vc_reg = vc_reg.attributes.delete_if {|k,v| k =="id" }
    vc = VacationConsultant.new(vc_reg)
    vc.created_at = Time.zone.now
    vc.updated_at = Time.zone.now
    vc
  end

  def create_destinations_vc_mapping
    preferred_locations.each do |pl|
      DestinationsVacationConsultants.find_or_create_by(:destination_id => pl.to_i, :vacation_consultant_id => id)
    end
    records = DestinationsVacationConsultants.where(:vacation_consultant_id => id)
    if records.present? && (records.count > preferred_locations.count)
      records.each do |r|
        if !preferred_locations.include?(r.destination_id.to_s)
          r.destroy
        end
      end
    end
  end

  private

  def reprocess_profile_picture
    profile_picture.assign(profile_picture)
    profile_picture.save
  end
end
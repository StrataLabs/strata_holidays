class VacationConsultant < ActiveRecord::Base
  has_many :vc_assignments
  has_many :consultant_customer_destinations
  belongs_to :user
  attr_accessor :status
  validates_presence_of ["name", "address_1", "city", "state", "country", "mphone", "email", "preferred_neighborhood", "preferred_locations"]
  validate :check_mobile_no

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
    text :poa do
      consultant_customer_destinations.map do |hsh|
        hsh.cust_iti_header.cust_iti_details.map do |h|
          h.destination.points_of_attractions.map {|poa| poa.name rescue ''}
        end
      end
    end
  end

  def self.search_me(query)
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
end
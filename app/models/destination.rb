class Destination < ActiveRecord::Base
  has_many :points_of_attractions
  has_many :dest_iti_headers
  has_and_belongs_to_many :vacation_consultants
  validates :name, presence: true, length: {minimum:3, maximum: 80}
  validates_presence_of :description
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    thumbnail: '100x150>'
  },
  :default_url => "unwinders/default.jpg"
  validates_attachment :image, :content_type => { :content_type => /image/ }, :size => { :in => 0..2.megabytes }
  # validates_attachment_size :image, :in => 0.megabytes..2.megabytes, :message => "Image must be less than 2 megabytes in size"

  searchable do
    text :name, :boost => 2.0
    string :class_name do
      self.class.name
    end
  end
end

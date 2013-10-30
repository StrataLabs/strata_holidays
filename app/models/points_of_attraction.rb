class PointsOfAttraction < ActiveRecord::Base
  belongs_to :destination
  belongs_to :poa_type
  has_many :dest_iti_details

  validates_presence_of :destination_id, :poa_type_id, :name, :description
  validates :name, length: {minimum:3, maximum: 80}
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    thumbnail: '100x150>'
  },
  :default_url => "unwinders/default.jpg"
  validates_attachment :image, :content_type => { :content_type => /image/ }, :size => { :in => 0..2.megabytes }

  searchable do
    text :name, :boost => 2.0
    string :class_name do
      self.class.name
    end
  end
end

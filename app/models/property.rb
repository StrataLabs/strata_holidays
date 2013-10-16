class Property < ActiveRecord::Base
  belongs_to :destination
  validates_presence_of :destination_id, :name, :property_type, :official_rating, :customer_rating
  validates :name, length: {minimum:3, maximum: 80}
  has_attached_file :image, styles: {
    square: '200x200#',
    thumbnail: '100x150>'
  },
  :default_url => "unwinders/default.jpg"
  #validates_attachment :image, :content_type => { :content_type => /image/ }, :size => { :in => 0..2.megabytes }
  PROPERTY_TYPES = ["Homestay","Hotel","Resort","Airport Transit Hotel"]
end

class TripImage < ActiveRecord::Base
    belongs_to :cust_iti_header
    has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    thumbnail: '100x150>'
  },
  :default_url => "unwinders/default.jpg"
  validates_attachment :image, :content_type => { :content_type => /image/ }, :size => { :in => 0..2.megabytes }
end

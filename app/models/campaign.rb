class Campaign < ActiveRecord::Base
  belongs_to :vacation_consultant
  has_attached_file :image, styles: {
    landscape: '300x150>',
    potrait: '150x300>'
  },
  :default_url => "unwinders/default.jpg"
  validates_presence_of :name
  validates_presence_of :vacation_consultant_id
  validates_attachment :image, :content_type => { :content_type => /image/ }, :size => { :in => 0..2.megabytes }
end

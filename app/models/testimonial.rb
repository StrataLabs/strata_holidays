class Testimonial < ActiveRecord::Base
  belongs_to :vacation_consultant
  validates_presence_of :content
end

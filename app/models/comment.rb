class Comment < ActiveRecord::Base
  has_ancestry
  validates_presence_of :content
  belongs_to :commentable, polymorphic: true
end

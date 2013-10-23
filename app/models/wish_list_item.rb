class WishListItem < ActiveRecord::Base
  belongs_to :customer
  validates :customer_id, :uniqueness => { :scope => :destination_id }
end

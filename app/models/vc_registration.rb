class VcRegistration < ActiveRecord::Base
  validates_presence_of ["name", "address", "city", "state", "preferred_neighborhood", "preferred_locations", "mphone", "email", "country"]
  validate :check_mobile_no

  def check_mobile_no
  if mphone.length != 10 || (mphone.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil)
      errors.add(:mphone, "invalid")
    end
  end
end
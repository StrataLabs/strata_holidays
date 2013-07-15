class VcRegistration < ActiveRecord::Base
  validates_presence_of ["name", "address_1", "address_2", "city", "state", "preferred_neighborhood", "preferred_locations", "mphone", "email", "country", "status"]
  validate :check_mobile_no

  def check_mobile_no
    if mphone.nil? || mphone.length != 10 || (mphone.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil)
      errors.add(:mphone, "invalid")
    end
  end
end

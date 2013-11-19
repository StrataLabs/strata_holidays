class VcRegistration < ActiveRecord::Base
  # include ActiveRecord::Transitions
  validates_presence_of ["name", "address_1", "address_2", "city", "state", "preferred_neighborhood", "preferred_locations", "mphone", "email", "country", "status"]
  validate :check_mobile_no
  serialize :preferred_locations
  belongs_to :user

  # before_create :set_state

  # state_machine :attribute_name => :status do
  #   STATES = [:New, :Approved, :Rejected].freeze

  #   STATES.each do |state_name|
  #     state state_name
  #   end

  #   event :approve do
  #     transitions :to => :Approved, :from => [:New]
  #   end

  #   event :reject do
  #     transitions :to => :Rejected, :from => [:New]
  #   end
  # end

  # def set_state
  #   self.state = "New"
  # end

  def check_mobile_no
    if mphone.nil? || mphone.length != 10 || (mphone.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil)
      errors.add(:mphone, "invalid")
    end
  end
end
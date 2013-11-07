class CustItiHeader < ActiveRecord::Base
  include ActiveRecord::Transitions
  belongs_to :vacation_type
  belongs_to :cust_iti_request
  belongs_to :customer
  belongs_to :vacation_consultant
  has_many :cust_iti_details, :dependent => :destroy
  has_many :trip_images, :dependent => :destroy
  accepts_nested_attributes_for :trip_images
  accepts_nested_attributes_for :cust_iti_details, :allow_destroy => true
  validates_presence_of ["customer_id", "state", "cust_iti_request_id", "cust_iti_name", "iti_type", "vacation_type_id", "trip_start_date", "trip_end_date", "seasons", "duration", "no_of_adults", "no_of_children"]

  before_create :set_state

  state_machine do
    STATES = [:New, :Published, :Approved, :Rejected].freeze

    STATES.each do |state_name|
      state state_name
    end

    event :publish do
      transitions :to => :Published, :from => [:New]
    end

    event :approve do
      transitions :to => :Approved, :from => [:Published]
    end

    event :reject do
      transitions :to => :Rejected, :from => [:Published]
    end
  end

  def set_state
    self.state = "New"
  end

  def valid_customer?
    if current_user.user_type == User::CUSTOMER && current_user.customer.id == self.cust_iti_request.customer_id
      return true
    end
    false
  end

end

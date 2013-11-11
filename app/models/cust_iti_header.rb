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
  validates_presence_of ["customer_id", "state", "cust_iti_request_id", "cust_iti_name", "iti_type", "vacation_type_id", "trip_start_date", "trip_end_date", "duration", "no_of_adults", "no_of_children"]

  before_create :set_state

  state_machine do
    STATES = [:New, :Published, :Pending, :Approved, :Rejected].freeze

    STATES.each do |state_name|
      state state_name
    end

    event :publish do
      transitions :to => :Published, :from => [:New, :Pending]
    end

    event :pending do
      transitions :to => :Pending, :from => [:Rejected]
    end

    event :approve, :success => :after_approval do
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

  def after_approval
    vc_assignment = VcAssignment.where(:cust_iti_request_id => self.cust_iti_request_id, :vacation_consultant_id => self.vacation_consultant_id).first
    vc_assignment.done!
    vc_assignment.save
  end

  def processEvent(event)
    p event
    case event
    when 'approve'
      self.approve!
    when 'reject'
      self.reject!
    when 'pending'
      p event
      p self.pending!
    end
  end
end

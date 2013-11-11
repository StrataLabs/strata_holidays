class VcAssignment < ActiveRecord::Base
  include ActiveRecord::Transitions
  belongs_to :vacation_consultant
  belongs_to :cust_iti_request
  has_many :cust_iti_headers
  validates_presence_of :vacation_consultant_id, :cust_iti_request_id, :state

  before_create :set_state

  state_machine do
    STATES = [:New, :InProcess, :Done].freeze

    STATES.each do |state_name|
      state state_name
    end

    event :process do
      transitions :to => :InProcess, :from => [:New]
    end

    event :complete do
      transitions :to => :Done, :from => [:InProcess]
    end
  end

  def set_state
    self.state = "New"
  end
end

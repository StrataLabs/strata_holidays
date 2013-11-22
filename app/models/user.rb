class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  validate :presence_of_name
  has_one :customer, :dependent => :destroy, :autosave => true
  has_one :vacation_consultant, :autosave => true
  has_one :vc_registration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  USER_TYPE = [
    ADMIN = "A",
    CUSTOMER = "C",
    VC = "V",
    DEFAULT = "D"
  ]
  after_create :build_customer_record , :if => Proc.new{|a| a.has_role? :traveller}

  def presence_of_name
    if !name.present?
      errors.add(:name, "Name cannot be blank")
    end
  end

  def build_customer_record
    self.customer = Customer.build(self)
    self.user_type = "C"
    self.save
    Delayed::Job.enqueue CustomerWelcomeJob.new(self)
  end

  def self.build_user_for_customer(params)
    password = "abcd1234"
    new(:name => params[:name], :email => params[:email], :password => password,
        :password_confirmation => password, :user_type => "C")
  end

  def self.build(params)
    #password = Devise.friendly_token.first(8)
    password = "abcd1234"
    new(:name => params["name"], :email => params["email"], :password => password,
        :password_confirmation => password, :user_type => "V")
  end

  def admin?
    (session[:user_role] == User::ADMIN)
  end
end

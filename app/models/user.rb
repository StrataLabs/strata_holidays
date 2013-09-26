class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_one :customer
  has_one :vacation_consultant, :autosave => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  USER_TYPE = [
    ADMIN = "A",
    CUSTOMER = "C",
    VC = "V"
  ]
  after_create :build_customer_record , :if => Proc.new{|a| !a.user_type.present?}

  def build_customer_record
    self.customer = Customer.build(self)
    self.user_type = "C"
    self.save
  end

  def self.build(params)
    #password = Devise.friendly_token.first(8)
    password = "abcd1234"
    new(:name => params["name"], :email => params["email"], :password => password,
        :password_confirmation => password, :user_type => "V")
  end

  def admin?
    (self.user_type == ADMIN)
  end
end

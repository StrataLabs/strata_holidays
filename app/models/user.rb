class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_one :customer
  has_one :vacation_consultant
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

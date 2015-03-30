class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets

  validates_presence_of :username

  def email_required?
    false
  end

  # attr_accessible :username, :password, :password_confirmation, :remember_me
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :bookings, dependent: :destroy
  after_create :init_user_profile

  def init_user_profile
    self.create_user_profile!
  end
end

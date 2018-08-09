class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :reviews

  has_one :employee_profile

  validates :role, inclusion: { in: %w(employee representative),
    message: "%{value} is not a valid role type" }, allow_nil: true

  after_create :send_welcome_email

    private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end

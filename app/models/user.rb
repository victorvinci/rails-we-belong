class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[linkedin]


  has_many :reviews, dependent: :nullify

  has_one :employee_profile, dependent: :destroy
  accepts_nested_attributes_for :employee_profile

  validates :role, inclusion: { in: %w(employee representative),
    message: "%{value} is not a valid role type" }, allow_nil: true

  validates :terms_of_service, acceptance: true

  after_create :send_welcome_email

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      # elsif data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      #   user.email = data["email"] if user.email.blank?
      end
    end
  end

  def has_profile?
    !employee_profile.nil?
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end

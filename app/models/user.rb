class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  # Send a custom welcome email after the user is created
  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end

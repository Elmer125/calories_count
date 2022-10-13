class Statitic < ApplicationRecord
  belongs_to :user
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  after_create :send_email

  def self.generate(email, user_id)
    user = User.find(user_id)
    return nil unless user

    create(user:, expires_date: DateTime.now + 1.week, token: generate_token, email:)
  end

  def self.generate_token
    Devise.friendly_token.first(16)
  end

  private

  def send_email
    StatiticsMailer.sign_in_mail(self).deliver_now
  end
end

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.config[:SENDGRID_USERNAME],
  password: Rails.application.credentials.config[:SENDGRID_PASSWORD],
  domain: 'gmail.com',
  address: 'smtp.gmail.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

class StatiticsMailer < ApplicationMailer
  default from: 'elmermarulanda5@gmail.com'
  def sign_in_mail(email_link)
    @token = email_link.token
    @email = email_link.email

    mail to: email_link.email, subject: 'link para ver el gráfico que te compartieron'
  end
end

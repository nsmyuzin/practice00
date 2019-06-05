class CustomerNotificationMailer < ActionMailer::Base
  layout 'mailer'

  def send_thanks_contact(contact,basic_info)
    @contact = contact
    @basic_info = basic_info
    mail(subject: "お問い合わせを受け付けました。",
         to: @contact.email,
         from: @basic_info.public_email)
  end
end

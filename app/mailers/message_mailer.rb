class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body

    mail to: "rad.assignment.2019@gmail.com", from: message.email
  end
end
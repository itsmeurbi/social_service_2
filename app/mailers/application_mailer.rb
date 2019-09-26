# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def exam_mail(link, student)
    @name = student.name
    @link = link
    mail to: student.email, subject: 'Examen'
  end
end

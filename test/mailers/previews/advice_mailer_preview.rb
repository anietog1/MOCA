# Preview all emails at http://localhost:3000/rails/mailers/advice_mailer
class AdviceMailerPreview < ActionMailer::Preview
  def alert_advice_size_preview
    AdviceMailer.alert_advice_size("eevinley@gmail.com", Session.first)
  end
end

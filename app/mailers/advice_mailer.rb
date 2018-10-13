# coding: utf-8
class AdviceMailer < ApplicationMailer
  default from: "mocainforma@gmail.com"
  
  def alert_advice_size(admin_email, advice)
    admin_email
    @advice = advice   
    mail to: admin_email, subject: "[ALERTA] Cupos para monitoría se están agotando"
  end
end

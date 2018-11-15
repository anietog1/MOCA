class ApplicationController < ActionController::Base

  before_action :set_locale

  def set_locale
    if params[:locale] != nil 
      I18n.locale = params[:locale].to_sym || I18n.default_locale
    else
      I18n.locale = I18n.default_locale
    end
  end
  
end

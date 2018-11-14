class ApplicationController < ActionController::Base

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale].to_sym || I18n.default_locale
  end
  
end

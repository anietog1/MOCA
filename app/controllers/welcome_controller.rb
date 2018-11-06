class WelcomeController < ApplicationController
  
 before_action :set_locale

  def set_locale
    I18n.locale = params[:locale].to_sym
  end
  
  def index
  end
end

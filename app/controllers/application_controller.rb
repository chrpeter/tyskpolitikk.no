require 'mime/types'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :set_locale!

  def set_locale!
    if Rails.env.test?
      I18n.locale = :en
    else
      I18n.locale = params[:locale] || :nb
    end
  end
end

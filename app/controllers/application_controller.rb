class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # session methods are moved to sessions helper
  # so logged_in? method works in views.
  # sessions helper module:  /app/helpers/sessions_helper.rb
  include SessionsHelper

end

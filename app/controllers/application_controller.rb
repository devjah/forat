class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  after_filter :allow_iframe

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

private
  def allow_iframe
      response.headers['X-Frame-Options'] = "ALLOW-FROM https://www.facebook.com"
  end

  def mobile_agent?
    request.user_agent =~ /Mobile|webOS/
  end

end

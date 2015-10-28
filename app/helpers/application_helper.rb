module ApplicationHelper

  def is_admin?
  	if user_signed_in?
  		current_user.try(:admin?)
  	end
  end

  def app_title
    # Mainlu for <title> tag
    "_app_title_"
  end

  def organizer
    # mentioned in footer disclaimer
    "_organizer_"
  end

  def app_domain
    if Rails.env.development? then "_app_name_.dev" else "_app_name_.herokuapp.com" end
  end

end

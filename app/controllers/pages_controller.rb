class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def tab
  end

  def admin
    @users = User.all.order('id DESC')
    render layout: "admin"
  end

private
  def is_admin?
    if user_signed_in?
      current_user.try(:admin?)
    end
  end

end

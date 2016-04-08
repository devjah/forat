class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!, except: [:show]

  def edit
    @user = current_user
  end

  def start
    current_user.update_attribute :started, true
    redirect_to root_url
  end

  def update
    if @user.update(user_params)
      @user.save
				redirect_to root_url, notice: 'OK'
    else
				render action: 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:phone, :name, :email)
    end

end

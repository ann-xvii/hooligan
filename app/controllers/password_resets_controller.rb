class PasswordResetsController < ApplicationController
  before_action :get_user,          only: [:edit, :update]
  before_action :check_expiration,  only: [:edit, :update]
  def new
  end

  def create
  	@user = User.where(email: params[:password_reset][:email]).first
  	if @user
  		@user.create_reset_digest
  		@user.send_password_reset_email
  		flash[:info] = "Email sent with password reset instructions"
  		redirect_to root_url
  	else
  		flash.now[:danger] = "Email address not found"
  		render :new
  	end
  end

  def edit
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank."
      render :edit
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # check if password is blank
  def password_blank?
    params[:user][:password].blank?
  end


  # before filters

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

end

class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(email: params[:login][:email]).first
		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
			log_in user
			remember user
      		redirect_to user
      	else
      		flash.now[:danger] = "Invalid email or password combination."
      		render :new
      	end
	end

	def destroy
		session.delete(:user_id)
		# log_out
		redirect_to login_path
	end
end

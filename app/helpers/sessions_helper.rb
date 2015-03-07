module SessionsHelper
	def current_user
		@current_user ||= User.find(session[:user_id])
	end

	def logged_in?
	  session[:user_id] != nil
	end

	# Logs in a given user
	def log_in(user)
		# was in create
	  session[:user_id] = user.id.to_s
	end
end

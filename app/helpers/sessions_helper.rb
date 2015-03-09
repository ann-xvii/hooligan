module SessionsHelper
	# Logs in a given user
	def log_in(user)
		# was in create
	  session[:user_id] = user.id.to_s
	end

	# remember a user in a persistent session
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	# returns the current logged in user if any
	def current_user
		@current_user ||= User.find(session[:user_id])
	end

	# boolean, returns true if user is logged in or false if otherwise
	def logged_in?
	  session[:user_id] != nil
	end

	# logs out the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end

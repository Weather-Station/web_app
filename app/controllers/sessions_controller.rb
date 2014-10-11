class SessionsController < ApplicationController
	skip_before_filter :user_logged_in?

	def login
		@login_failed = flash[:login_failed]
		@user = User.new
	end

	def authenticate
		user = User.find_by(:username => user_auth_params[:username])
		if !user.nil? && user.try(:authenticate, user_auth_params[:password])
			#success
			reset_session
			#reset the session and give them a session ID
			session[:uid] = user.id
			redirect_to root_path
			#we want to redirect the user to the device manage page.

		else
			#failure
			#redirect them to the login page & tell them about it
			flash[:login_failed] = true
			redirect_to login_path
		end

	end
	def logout
		reset_session
		redirect_to root_path

	end
	def new_user
		#work out how to display errors
		@errors = flash[:errors]
		unless @errors.nil?
			render :text => @errors
		else
			@errors = false
		end
	end
	def create
		new_user = User.new(user_create_params)
		unless new_user.save
			flash[:errors] = new_user.errors
			redirect_to sessions_new_user
		end
		redirect_to root
	end

	private
	def user_create_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end

	private
	def user_auth_params
		params.require(:user).permit(:username,:password)#Strong parameters
	end
end

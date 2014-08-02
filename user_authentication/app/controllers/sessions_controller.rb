class SessionsController < ApplicationController

	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			flash[:notice] = "You're logged in"
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:notice] = "Try again..."
			redirect_to log_in_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You're logged out"
		redirect_to '/'
	end

end

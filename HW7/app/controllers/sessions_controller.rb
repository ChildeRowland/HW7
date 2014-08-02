class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			flash[:notice] = "You've been logged in"
			session[:user_id] = @user.id
			redirect_to user_path @user
		else
			flash[:notice] = "bogus credentials"
			redirect_to new_user_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		redirect_to '/'
	end

end

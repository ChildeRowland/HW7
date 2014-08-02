class UsersController < ApplicationController

	def new

	end

	def create
		if User.new(user_params).save
			flash[:notice] = "New User Added"
			redirect_to '/'
		else
			flash[:notice] = "José no-way, try again."
			redirect_to '/'
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end

class UsersController < ApplicationController

	def index
	end

	def show
		@user = current_user
	end

	def new
	end

	def create
		if User.new(user_params).save
			flash[:notice] = "Welcome Aboard"
			redirect_to '/'
		else
			flash[:notice] = "Mixed up? Try again."
			redirect_to :back
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end

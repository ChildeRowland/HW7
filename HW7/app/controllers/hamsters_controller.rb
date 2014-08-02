class HamstersController < ApplicationController

	def index
		@user = current_user
		@hamster = @user.hamsters
	end

	def show
		@user = current_user
		@hamster = @user.hamsters.find(params[:id])
	end

	def new
		@user = current_user
		@hamster = Hamster.new
	end

	def create
		@user = current_user
		@hamster = @user.hamsters.build(params_hamster)
		if @hamster.save
			flash[:notice] = "That's a badass hamster"
			redirect_to user_hamsters_path @user
		else
			flash[:notice] = "Bummer. No new hammy."
			redirect_to :back
		end
	end

	def edit
		@user = current_user
		@hamster = @user.hamsters.find(params[:id])
	end

	def update
		@user = current_user
		@hamster = @user.hamsters.find(params[:id])
		if @hamster.update_attributes(params_hamster)
			flash[:notice] = "Almost just like new."
			redirect_to user_hamsters_path @user
		else
			flash[:notice] = "No changes, try again?"
			redirect_to :back
		end
	end

	def destroy
		@user = current_user
		if Hamster.find(params[:id]).delete
			flash[:notice] = "You killed your Hammy"
			redirect_to user_path @user
		else
			flash[:notice] = "Hammy survived."
			redirect_to :back
		end
	end

	private
	def params_hamster
		params.require(:hamster).permit(:name, :phrase)
	end

end

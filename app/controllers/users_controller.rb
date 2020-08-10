class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
	before_action :require_user, only: [:edit, :update]
	before_action :require_same_user, only: [:edit, :update]

	def new
		# @user = User.new
	end

	def edit
	# byebug
		# @user = User.find(params[:id])
	end

	def update
		# @user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "You are account has been successfully edited"
			redirect_to chatrooms_path
		else
			render :edit
		end
	end

	def create
		user = User.new(user_params)
		if params[:user][:password] == params[:user][:password_confirmation] && user.save 
			flash[:success] = "You are account has been created with #{user.email}"
			redirect_to chatrooms_path
		else
			user.valid?
			flash.now[:error] = "#{user.errors.full_messages.first}"
			render :new
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

	def require_same_user
		if current_user != @user
			flash[:error] = "You can only edit or delete your own profile"
			redirect_to chatrooms_path
		end
	end
end

class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to chatroom_path(Chatroom.find(Chatroom.first.id))
		else
			flash.now[:error] = "Wrong credential"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have successfully logged out"
		redirect_to login_path
	end
end

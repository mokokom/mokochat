class ChatroomsController < ApplicationController
	before_action :require_user

	def index
		@chatrooms = Chatroom.all
	end

	def edit
		@chatroom = Chatroom.find(params[:id])
	end

	def update
		@chatroom = Chatroom.find(params[:id])
		if @chatroom.update(chatroom_params)
			redirect_to chatroom_path(@chatroom)
		else
			render :edit
		end
	end

	def create
		@chatroom = Chatroom.new(chatroom_params)
		@chatroom.created_by = current_user.id if @chatroom.valid?
		if @chatroom.save
			flash[:success] = "Chatroom #{@chatroom.name} created"
			redirect_to chatroom_path(@chatroom)
		end
	end
	
	def show
		# @chatroom = Chatroom.find(params[:id])
		@chatrooms = Chatroom.all
		# session[:user_id] = nil
		# byebug
		if params[:id].nil?
			@chatroom = Chatroom.find(2)
		else
			@chatroom = Chatroom.find(params[:id])
			render :index
		end
		@messages = Message.custom_display
	end

	def destroy
		@chatroom = Chatroom.find(params[:id])
		@chatroom.destroy
		flash[:success] = "#{@chatroom.name} has been deleted successfully"
		redirect_to chatrooms_path
	end

	private

	def chatroom_params
		params.require(:chatroom).permit(:name)
	end

end

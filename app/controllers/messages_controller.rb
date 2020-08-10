class MessagesController < ApplicationController

	def create
		# byebug
		@message = Message.new(message_params)
		@message.chatroom_id = params[:chatroom_id]
		@message.user_id = current_user.id
		if @message.save
			# redirect_to chatroom_path(params[:chatroom_id])
			SendMessageJob.perform_later(@message)
		end
	end

	private

	def message_params
		params.require(:message).permit(:content)
	end

	# def render_message(message)
		
	# end
end

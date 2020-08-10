class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_channel_#{params[:chatroom_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

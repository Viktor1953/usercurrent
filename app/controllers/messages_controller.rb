class MessagesController < ApplicationController
# чтобы проходила аутентификация 
  before_action :authenticate_user! 

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.user = current_user
    @message.save
    # redirect_to room_path(@room)

  end

  def destroy 
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end

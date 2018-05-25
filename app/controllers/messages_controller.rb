class MessagesController < ApplicationController
  def index
    @me = current_user
    @other_user = User.find(params[:user_id])
    # Find the other user through params
    # @other_user = User.find(params)
    # Figure out ActiveRecord query to get all messages from both these users, ordered by created at
    @messages =  Message.where("(sender_id = ? and receiver_id = ?) OR (sender_id = ? and receiver_id = ?)", @me.id, @other_user.id, @other_user.id, @me.id )
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to user_messages_path(@message.receiver)
    else
      render :new
    end
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

class MessagesController < ApplicationController
  def index
    @me = current_user
    @other_user = User.find(params[:user_id])
    @empty_message = Message.new
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

  def my_messages
    @me = current_user
    # @my_conversations = User.joins(:received_messages).joins(:sent_messages).where("messages.sender_id = #{current_user.id} OR
    #                       messages.receiver_id = #{current_user.id}")
                  # .distinct.reject { |user| user ==current_user }
    # @my_messages = Message.where("receiver_id = ?", @me.id)
    users_id_conversation = Message.where("sender_id = ? OR receiver_id = ?", @me.id, @me.id)
    .flat_map{|message| [message.sender_id, message.receiver_id]}.uniq

    @my_conversations = User.find(users_id_conversation).reject { |user| user == current_user }

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

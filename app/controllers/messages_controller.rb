class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else

      @messages = Message.all
      flash.now[:alert] = "u failed to save msg."
      render 'index'
    end
  end
  private
  
 def message_params
  params.require(:message).permit(:name, :body)
 end
 
end

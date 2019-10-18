class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages
  end

  def create
   message = Message.create(message_params)
   if message.valid?
     render json: message
   else
     render json: {errors: message.errors.full_messages}, status: 422
   end
 end

 def update
   message = Message.find(params[:id])
   if message.update(message_params)
     render json: message
   else
     render json: {errors: message.errors.full_messages}, status: 422
   end
 end

 def destroy
   message = Message.find(params[:id])
   message.delete
 end


 private
   def message_params
     params.permit(:message, :channel_id, :user_id)
   end

end

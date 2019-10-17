class ChannelsController < ApplicationController

  def index
    channels = Channel.all
    render json: channels
  end

  def create
   channel = Channel.create(channel_params)
   if channel.valid?
     render json: channel
   else
     render json: {errors: channel.errors.full_messages}, status: 422
   end
 end

 def update
   channel = Channel.find(params[:id])
   if channel.update(channel_params)
     render json: channel
   else
     render json: {errors: channel.errors.full_messages}, status: 422
   end
 end

 def destroy
   channel = Channel.find(params[:id])
   channel.delete
 end


 private
   def channel_params
     params.permit(:name, :img)
   end

end

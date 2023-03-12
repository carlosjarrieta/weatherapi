class CityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "city_channel_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

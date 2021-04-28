module ApplicationCable
  class Channel < ActionCable::Channel::Base
  def subscribed
    # stream_from "some_channel"
    # 接続された時
    stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # 切断された時
  end

  def speak(message)
    grouppost = GroupPost.new(message: message['message'][0], member_id: message['message'][1].to_i, group_id: message['message'][2].to_i)
    grouppost.save
    ActionCable.server.broadcast 'group_channel', message: message['message'][0] # フロントへ返します
  end
  end
end



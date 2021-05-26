class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    @msg = message
    ActionCable.server.broadcast("room_channel_#{message.room_id}", { html: html })
  end

  def html
     MessagesController.render(
      partial: 'messages/message',
      locals: { message: @msg }
    )
  end
end

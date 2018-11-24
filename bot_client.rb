#!/usr/bin/env ruby
require 'telegram/bot'
require File.expand_path('../config/environment', File.dirname(__FILE__))

Telegram::Bot::Client.run(Rails.application.config.bot_token) do |bot|
  Rails.logger.info "=== #{Rails.application.config.bot_name} is listening now ==="

  bot.listen do |message|

    begin

      puts "#{message.text} - CHAT_ID: #{message.chat.id} (UID: #{message.from.id})"
      user = User.find_by_chat_id(message.chat.id)
      Rails.logger.info "User id #{user.id} - chat #{user.chat_id} - #{user.full_name}" if user

      message_to_user = Bot::StageManager.new.manage(user, message)

      ####################### Replying to user right here #########################

      next if message_to_user[:message].nil?

      # trying to find user once more (StageManager should have created one)
      unless user
        user = User.find_by_chat_id(message.chat.id)
      end

      Communication::ChatSpeaker.new.thread_speak_to_user(user.chat_id, message_to_user)

     if Rails.application.config.save_messages
       BotMessage.create!(text: message.text, from: message.from.id)
     end
   rescue => e
        puts "ERROR: #{e}\n\n #{e.backtrace.join("\n")}"
        begin
          Communication::BotNotification.message_to_support("ERROR:\n#{e.message}\n\n#{e.backtrace.join("\n")}")
        rescue => e
          puts "ERROR__2: #{e}"
        end
    end
  end
end

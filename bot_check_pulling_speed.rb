#!/usr/bin/env ruby
require 'telegram/bot'
require File.expand_path('../config/environment', File.dirname(__FILE__))

Telegram::Bot::Client.run(Rails.application.config.bot_token) do |bot|
  Rails.logger.info 'Bot Pulling checks'

  $message_count = 0
  $start_time = Time.now

  bot.listen do |message|
    $message_count += 1
    puts "Message count: #{$message_count} - Took: #{Time.now-$start_time}"
  end
end

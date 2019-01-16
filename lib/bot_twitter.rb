require 'dotenv'
require 'twitter'

def login
  Dotenv.load
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
    config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
    config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
    config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
  end
  client  
end

def test_connection(client)
  if client.nil?
    false
  else
    true
  end
end

def send_tweet(str, client)
  puts 'envoyer votre tweet'
  print '> '
  user_message = gets.chomp
  client.update(str)
  puts "le massage \"#{user_message} \" a ete envoyer avec succes"
end

def perform
  client = login
  if test_connection(client) == true
    
    send_tweet(user_message, client)
  else
    puts 'error'
  end
end

perform

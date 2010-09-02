require 'rubygems'
require 'sinatra'

post "/send_sms" do
  puts params.inspect
  "sent"
end

get "/send_sms" do
  puts "***********************GETrequest"
  puts params.inspect
  "sent"
end

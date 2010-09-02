class SmsController < ApplicationController
	def create
		status, message = Inbox.send_sms params
		respond_to do |format|
      format.js{render :status => "200", :text => "SMS sent successfully!"}
    end
	end
end

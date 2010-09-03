class SmsController < ApplicationController
	def create
		status, message = Inbox.send_sms params
		respond_to do |format|
      format.js{render :status => status, :text => message}
    end
	end
end

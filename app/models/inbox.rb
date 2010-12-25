class Inbox < ActiveRecord::Base
	belongs_to :sender, :class_name => "User", :foreign_key => "s_id"
	belongs_to :recipient, :class_name => "User", :foreign_key => "d_id"
	validates_presence_of :message, :recipient
	
	def self.send_sms params
    mobile = params[:gsms_mobile].strip_tags.strip
    name = params[:gsms_name].strip_tags.strip
    message = params[:gsms_message].strip_tags.strip
    
    if mobile_valid?(mobile)
      recipient = get_recipient_user(mobile, name)
      if recipient.present?
        send_message(recipient, message)
      else
        return 500, "No Recipient Found"
      end
    else
      return 500, "Mobile number not valid!"
    end
	end
	
	def mobile_valid?(mobile)
	  number = mobile[/\d+/][/\d{1,10}$/]
	  number.length == 10 ? number.to_i : nil
	end
	
	def get_recipient_user(mobile, name)
	  user = User.find_or_create_by_mobile(:mobile => mobile, :name => name)
	 	user.present? ? user : nil
	end
	
	def send_message(recipient, message, sender = nil)
	  request = Ravience::Request.new(recipient.mobile, message)
	  response = request.send_request
	  if response
	    sms = self.create(:message => params[:message], :d_id => recipient.id) 
	 	  return 200, "Message sent successfully!"
	 	else
	 	  return 500, "Message sending failed!"
 	  end
	end
end

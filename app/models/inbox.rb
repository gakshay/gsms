class Inbox < ActiveRecord::Base
	belongs_to :sender, :class_name => "User", :foreign_key => "s_id"
	belongs_to :recipient, :class_name => "User", :foreign_key => "d_id"
	validates_presence_of :message
	def self.send_sms params
		begin
			recipient_mobile = params[:gsms_mobile]
			recipient_name = params[:gsms_name]
			recipient = User.find_or_create_by_mobile(:mobile => recipient_mobile, :name => recipient_name)
			sms = self.create(:message => params[:gsms_message], :d_id => recipient.id)
			Gmail.deliver_web_sms(recipient, sms.message)
			return 200, "Message Sent Successfully!"
		rescue
			return 500, "Not Sent Successfully!"
		end
	end
end

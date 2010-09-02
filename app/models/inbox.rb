class Inbox < ActiveRecord::Base
	belongs_to :sender, :class_name => "User", :foreign_key => "s_id"
	belongs_to :recipient, :class_name => "User", :foreign_key => "d_id"

	def self.send_sms params
		recipient_mobile = params[:gsms_mobile]
		recipient_name = params[:gsms_name]
		recipient = User.find_or_create_by_mobile(:mobile => recipient_mobile, :name => recipient_name)
		sms = self.create(:message => params[:gsms_message], :d_id => recipient.id)
		
	end
end

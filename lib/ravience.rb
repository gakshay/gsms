module Ravience
  
  USER = "webonise"
  PASSWORD = "webo123soft"
  SENDERID = "Webonise"
  
  # set the submission uri to sandbox for development and live for production
  def self.uri
    # Ravience.in_production? ? "http://www.ravience.in/cgi-bin/sms.cgi?" : "http://www.ravience.in/cgi-bin/sms.cgi?"
    uri = "http://www.ravience.in/cgi-bin/sms.cgi?User=#{Ravience::USER}&Password=#{Ravience::PASSWORD}"
    uri += "&ReceiptRequested=Yes&sender=#{Ravience::SENDERID}&" 
  end

  def self.test?
    not Ravience.in_production?
  end
  
  def self.in_production?
    Rails.env == 'production'
  end
 
  # process payment response notifications
  require 'net/http'
  require 'uri'
  class Request
    
    def initialize(mobile, message)
      @url = Ravience.uri + "PhoneNumber=91#{mobile}&Text=#{message}"
      print @url
    end
    
    def send_request
      response = Net::HTTP.get_response(URI.parse(@url))
      case response
      when Net::HTTPSuccess     then response
      else
        response.error!
      end
    end
    
  end #Request class end
end #ravience module end
class Gmail < ActionMailer::Base
  
  def web_sms(user,message)
    recipients  "#{user.mobile}.gakshay@160by2.com"
    from        "akshay.aries11@gmail.com"
    subject     "hi"
    body        :message => message, :user => user
  end
end

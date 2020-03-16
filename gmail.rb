require "json"
require "mail"

class Gmail
  def initialize(**mail)
    @from = mail[:from]
    @passwd = mail[:passwd]
    @to = mail[:to]
    @subject = mail[:subject]

  end

  def deliver(weather_response)
    #mail_from   = 'yuyueureka157@gmail.com'
    #mail_passwd = 'udxieczjeuiprybt'
    #mail_to     = 'yuyueureka157@gmail.com'
    #mail_subject= 'メールタイトル'
    mail_body = <<~EOS
      メール本文
      本日の#{ENV["PREFECTURE"]}の天気：#{weather_response}
    EOS

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => 587,
        :domain => 'example.com',
        :user_name => "#{@from}",
        :password => "#{@passwd}",
        :authentication => :login,
        :enable_starttls_auto => true
      }
    end

    mail = Mail.new do
      from "#{@from}"
      to "#{@to}"
      subject "#{@subjecr}"
      body "#{mail_dody}"
    end

    mail.charset = "UTF-8"
    mail.content_transfer_encoding = "8bit"
    mail.deliver
  end
end

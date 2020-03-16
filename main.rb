require "./weather_api"
require "./gmail"

weather_response = Weather.request_api
gmail = Gmail.new(to:'yuyueureka157@gmail.com', passwd:'udxieczjeuiprybt', to:'yuyueureka157@gmail.com', subject:'メールタイトル' )
gmail.deliver(weather_response)

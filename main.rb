require "./weather_api"
require "./gmail"

weather_response = Weather.request_api
gmail = Gmail.new
gmail.deliver(weather_response)

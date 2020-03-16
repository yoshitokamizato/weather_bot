require "open-uri"
require "dotenv"
Dotenv.load

class Weather

  def self.request_api
    response = open(ENV["BASE_URL"] + "?q=#{ENV["PREFECTURE"]},jp&APPID=#{ENV["API_KEY"]}")
    hash = JSON.parse(response.read)
    puts hash["weather"][0]["description"]
  end
end

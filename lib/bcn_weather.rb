require "bcn_weather/version"
require 'dotenv/load'

module BcnWeather
  class CityNotFound < StandardError; end

  require 'bcn_weather/weather_api'
  require 'bcn_weather/weather_api/client'
  require 'bcn_weather/weather_api/uri_builder'
  require 'bcn_weather/response_parser'
  require 'bcn_weather/forecast'
  require 'bcn_weather/search_city'

  class Handler
    def initialize(action:, city:)
      @action = action
      @city = city
      @api = Client.new(affiliate_id: ENV["AFFILIATE_ID"])
      puts ENV["AFFILIATE_ID"]
      @parser = ResponseParser.new
    end

    def call
      cities = get_cities
      city = find_city(cities)
      get_forecast_for(city)
    end

    private
    def get_cities
      doc = File.open(File.dirname(__FILE__) + "/bcn_weather/data/cities.xml")
      @parser.parse_cities(doc)
    end

    def find_city(cities)
      city_id = SearchCity.new(cities).call(@city)[:id]
      city = @api.get_city(city_id)
      @parser.parse_city(city)
    end

    def get_forecast_for(city)
      forecast = Forecast.new(
        where: city[:name], 
        min_temps: city[:min_temps], 
        max_temps: city[:max_temps]
      )
      forecast.send(@action)
    end
  end
end

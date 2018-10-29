require "bcn_weather/version"

module BcnWeather
  class CityNotFound < StandardError; end

  require 'bcn_weather/weather_api'
  require 'bcn_weather/weather_api/client'
  require 'bcn_weather/weather_api/uri_builder'
  require 'bcn_weather/response_parser'
  require 'bcn_weather/forecast'
  require 'bcn_weather/search_city'
end

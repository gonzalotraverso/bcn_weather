class SearchCity
  def initialize(cities)
    @cities = cities
  end

  def call(city_name)
    name = city_name.strip.capitalize
    city = @cities.detect { |city| city[:name] == name }
    raise BcnWeather::CityNotFound if city.nil?
    city
  end
end
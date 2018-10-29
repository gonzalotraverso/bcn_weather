require "nokogiri"

class ResponseParser
  def parse_cities(doc)
    parse(doc).css('name').map { |city| { name: city.content, id: city["id"] } }
  end

  def parse_city(doc)
    parsed = parse(doc)
    {
      name: format_city_name(parsed.at_css('location')["city"]),
      min_temps: parsed.css('name:contains("Temperatura Mínima") ~ data forecast').map(&map_temps),
      max_temps: parsed.css('name:contains("Temperatura Máxima") ~ data forecast').map(&map_temps)
    }
  end

  private
  def parse(doc)
    Nokogiri::XML(doc)
  end

  def format_city_name(city_name)
    city_name.gsub("[Barcelona;España]", "").strip
  end

  def map_temps
    proc { |forecast| { day: forecast["data_sequence"], forecast: forecast["value"].to_i } }
  end
end
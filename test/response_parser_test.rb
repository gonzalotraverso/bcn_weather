require 'test_helper'

class RseponseParserTest < Minitest::Test
  def setup
    @parser = ResponseParser.new
  end

  def test_parse_cities
    doc = File.open(File.dirname(__FILE__) + "/fixtures/cities.xml")

    data = @parser.parse_cities(doc)

    assert(data.size == 35)
    assert_equal(data[0][:name], 'Abrera')
    assert_equal(data[0][:id], "1182")
  end

  def test_parse_city
    doc = File.open(File.dirname(__FILE__) + "/fixtures/city.xml")

    data = @parser.parse_city(doc)

    assert_equal(data[:name], 'Agora Parc')
    assert(data[:min_temps].size == 7)
    assert(data[:max_temps].size == 7)
  end
end

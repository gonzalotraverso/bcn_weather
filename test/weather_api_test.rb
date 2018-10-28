require 'test_helper'

class WeatherApiTest < Minitest::Test
  def setup
    @api = Client.new(affiliate_id: 'some_id')
    @builder = UriBuilder.new("http://api.tiempo.com/")
  end

  def test_get_cities
    uri = @builder.call(api_lang: 'es', affiliate_id: 'some_id', division: '102')
    stub_request(:get, uri)

    assert @api.get_cities
  end


  def test_not_found
    uri = @builder.call(api_lang: 'es', affiliate_id: 'some_id', localidad: '123')
    stub_request(:get, uri).to_return(status: 404)

    assert_raises ArgumentError do
      @api.get_city('123')
    end
  end

  def test_get_city
    uri = @builder.call(api_lang: 'es', affiliate_id: 'some_id', localidad: '123')
    stub_request(:get, uri)

    @api.get_city('123')
  end
end

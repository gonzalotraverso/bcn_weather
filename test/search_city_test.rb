require 'test_helper'

class SearchCityTest < Minitest::Test
  def setup
    @data = [
      { name: 'City1', id: 1234 },
      { name: 'City2', id: 2345 },
      { name: 'City3', id: 3456 }
    ]
    @search = SearchCity.new(@data)
  end

  def test_call
    assert_equal(@search.call('City1'), { name: 'City1', id: 1234 })
    assert_equal(@search.call('city3'), { name: 'City3', id: 3456 })
    assert_equal(@search.call(' city2 '), { name: 'City2', id: 2345 })

    assert_raises BcnWeather::CityNotFound do
      @search.call('City5')
    end
  end
end

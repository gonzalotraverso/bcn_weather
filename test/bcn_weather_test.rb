require 'test_helper'

class BcnWeatherTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BcnWeather::VERSION
  end
end

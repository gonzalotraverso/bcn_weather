require 'test_helper'

class ForecastTest < Minitest::Test
  def setup
    @data = {
      name: 'City Name',
      min_temps: [
        { day: 1, forecast: 5 },
        { day: 2, forecast: 8 },
        { day: 3, forecast: 4 },
        { day: 4, forecast: 5 },
        { day: 5, forecast: 5 },
        { day: 6, forecast: 9 },
        { day: 7, forecast: 10 },
      ],
      max_temps: [
        { day: 1, forecast: 10 },
        { day: 2, forecast: 14 },
        { day: 3, forecast: 8 },
        { day: 4, forecast: 10 },
        { day: 5, forecast: 12 },
        { day: 6, forecast: 15 },
        { day: 7, forecast: 19 },
      ]
    }
    @forecast = Forecast.new(
      where: @data[:name], 
      min_temps: @data[:min_temps], 
      max_temps: @data[:max_temps]
    )
  end

  def test_today
    assert_equal(@forecast.today, { min: 5, max: 10 })
  end

  def test_week_min_avg
    assert_equal(@forecast.week_min_avg, 6)
  end

  def test_week_max_avg
    assert_equal(@forecast.week_max_avg, 12)
  end
end
class Forecast
  attr_reader :city_name

  def initialize(where:, min_temps:, max_temps:)
    @city_name = where
    @min_temps = min_temps
    @max_temps = max_temps
  end

  def today
    {
      min: @min_temps[0][:forecast],
      max: @max_temps[0][:forecast]
    }
  end

  def week_min_avg
    avg(@min_temps)
  end

  def week_max_avg
    avg(@max_temps)
  end

  private
  def avg(temps)
    temps.inject(0) { |sum, temp| sum + temp[:forecast] } / 7
  end
end
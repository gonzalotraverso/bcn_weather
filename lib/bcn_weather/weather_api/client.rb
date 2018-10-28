require 'faraday'

class Client
  URL = "http://api.tiempo.com"

  def initialize(affiliate_id: '')
    @affiliate_id = affiliate_id
    @conn = Faraday.new(url: URL)
  end

  def get_cities
    # get data from barcelona cities
    get_resource(:division, 102)
  end

  def get_city(id)
    get_resource(:localidad, id)
  end

  private
  def get_resource(name, value)
    response = @conn.get '/', { api_lang: 'es', affiliate_id: @affiliate_id, name => value }
    unless response.status == 200
      raise ArgumentError, "Wrong parameters"
    end
    response.body
  end
end
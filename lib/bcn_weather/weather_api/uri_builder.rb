class UriBuilder
  def initialize(base_url)
    @base_uri = URI(base_url)
  end

  def call(**params)
    @base_uri.query = URI.encode_www_form(params)
    @base_uri
  end
end
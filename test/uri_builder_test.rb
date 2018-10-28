require 'test_helper'

class UriBuilderTest < Minitest::Test
  def setup
    @builder = UriBuilder.new("http://something.com")
  end

  def test_build_uri_with_params
    url = @builder.call(id: 'an_id', city: 'other_thing')

    assert_equal url, URI("http://something.com?id=an_id&city=other_thing")
  end
end

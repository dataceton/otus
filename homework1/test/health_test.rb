require "minitest/autorun"
require "rack/test"
require "json"

class HealthTest < Minitest::Test
  include Rack::Test::Methods

  def app
    @app ||= Rack::Builder.parse_file("config.ru").first
  end

  def test_health_response
    get "/health"
    assert last_response.ok?
    json_response = JSON.parse(last_response.body)
    assert_equal "OK", json_response["status"]
  end
end
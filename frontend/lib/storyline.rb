require 'rest_client'
require 'json'

class Storyline

  attr_accessor :raw

  BASE_URL = 'http://newshack-storyline-backend.herokuapp.com/'

  def initialize(id, fixtures)
    @fixtures = fixtures
    @id = id
    get_data id
  end

  def get_data id
    if (@fixtures == 'true')
      fixture = File.read('fixtures/storyline.json')
      @raw = JSON.parse(fixture)
    else
      response = RestClient.get(BASE_URL + '/storyline/' + id)
      @raw = JSON.parse(response)
    end
  end

end
require 'json'
require 'rest-client'

require 'model/storyline'

class JuicerClient
  def initialize
    @base_url = "http://bbc.api.mashery.com/juicer-ld-api"
    @api_key = "waf3gwce8wjedceh4aq7p6jc"
  end
  
  def get_storyline guid
    response = get("/storylines/graphs?uri=http://www.bbc.co.uk/things/#{guid}")
    json = JSON.parse(response)
    Storyline.new(json["@graph"])
  end

  def get_event uri
    response = get("/storylines/graphs?uri=#{uri}")
    json = JSON.parse(response)
    Storyline.new(json["@graph"])
  end
  
  private
  
  def get url
    RestClient.get(@base_url + url + "&api_key=" + @api_key + "&cb=#{Time.now.to_i}")
  end

end
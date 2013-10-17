require 'json'
require 'rest-client'
require 'model/contentapi'

class ContentApiClient
  def initialize
    @base_url = "http://bbc.api.mashery.com/content/asset/"
    @api_key = "waf3gwce8wjedceh4aq7p6jc"
  end
  
  def get_asset id
    response = get("#{id}")
    json = JSON.parse(response)
    ContentApi.new(json["results"].first)
  end
  
  private
  
  def get url
    RestClient.get(@base_url + url + "?api_key=" + @api_key, {"X-Candy-Platform" => "desktop", "X-Candy-Audience" => "domestic", "Accept" => "application/json"})
  end
end
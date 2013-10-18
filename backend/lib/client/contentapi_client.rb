require 'json'
require 'rest-client'
require 'model/cps_asset'

class ContentApiClient
  def initialize
    @base_url = "http://bbc.api.mashery.com/content/asset/"
    @api_key = "waf3gwce8wjedceh4aq7p6jc"
  end
  
  def get_asset id
    response = get("#{id}")
    if response
      json = JSON.parse(response)
      CPSAsset.new(json["results"].first)
    else
      nil
    end
  end
  
  private
  
  def get url
    sleep 1
    full_url = @base_url + url + "?api_key=" + @api_key
    begin
      RestClient.get(full_url, {"X-Candy-Platform" => "desktop", "X-Candy-Audience" => "domestic", "Accept" => "application/json"})
    rescue
      nil
    end
  end
end
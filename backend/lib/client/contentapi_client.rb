require 'json'
require 'rest-client'
require 'model/cps_asset'

class ContentApiClient
  def initialize
    @base_url = "http://bbc.api.mashery.com/content/asset/"
    @api_key = "waf3gwce8wjedceh4aq7p6jc"
    @cache = if ENV['IS_HEROKU']
      Dalli::Client.new(
        ENV["MEMCACHIER_SERVERS"], {
          :username => ENV["MEMCACHIER_USERNAME"],
          :password => ENV["MEMCACHIER_PASSWORD"]
        }
      )
    else
      nil
    end
  end
  
  def get_asset id
    puts "GETTING ASSET #{id}"
    response = get("#{id}")
    if response
      puts "ASSET RESPONSE #{response.code}"
      json = JSON.parse(response)
      CPSAsset.new(json["results"].first)
    else
      puts "ASSET RESPONSE NIL"
      nil
    end
  end
  
  private
  
  def get url
    puts "GETTING (#{@cache}) #{url}"
    if @cache
      cached_response = @cache.get(url)
      if cached_response
        return @cache.get(url)
      end
    end
    
    sleep 0.55
    full_url = @base_url + url + "?api_key=" + @api_key
    begin
      response = RestClient.get(full_url, {"X-Candy-Platform" => "desktop", "X-Candy-Audience" => "domestic", "Accept" => "application/json"})
      puts "RESPONSE #{response.code}"
      if @cache
        cache.set(url, response, 3600)
      end
      return response
    rescue => e
      puts "RESPONSE #{e.response.code}"
      nil
    end
  end
end
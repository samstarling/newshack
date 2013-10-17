require 'json'
require 'rest-client'
require 'model/cps_asset'

class TextTeaserApi
  def initialize
    @base_url = "http://www.textteaser.com/"
  end
  
  def get_summary uri
    response = get_key("#{uri}")
  end
  
  private
  
  def get_key url
    full_url = @base_url
    begin
        response = RestClient.post(full_url, :url => url)
    rescue => e
        uri = e.response.headers[:location]
        key = uri.split("/")[4]
        summary = RestClient.get(@base_url + "ninja/#{key}")
        while(JSON.parse(summary)['status'] == "Pending")
            sleep(1)
            summary = RestClient.get(@base_url + "ninja/#{key}")
            puts summary
        end
        return summary
    end
  end
end
require 'json'
require 'rest-client'

require 'model/storyline'

class VideoClient
  def initialize
    @base_url = "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/format/json/vpid/"
    @end_url = "/mediaset/journalism-http-mobile"
  end
  
  def get_video asset_uri
    client = ContentApiClient.new
    asset = client.get_asset asset_uri
    if asset.video_href 
        response = get_raw(asset.video_href)
        playlist = Nokogiri::XML(response)
        vpid = playlist.xpath('//xmlns:playlist//xmlns:item//xmlns:mediator').attribute('identifier')
        mediaselector = JSON.parse(get vpid)
        return mediaselector['media'][0]['connection'][0]['href']
    else
        return nil
    end
  end

  def get_event uri
    response = get("/storylines/graphs?uri=#{uri}")
    json = JSON.parse(response)
    Storyline.new(json["@graph"])
  end
  
  private
  
  def get vpid
    RestClient.get(@base_url + vpid + @end_url)
  end

  def get_raw url
    RestClient.get(url)
  end
end
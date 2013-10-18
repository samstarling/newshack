require 'json'
require 'rest-client'

require 'model/storyline'
require 'model/video'

class VideoClient
  def initialize
    @base_url = "http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/format/json/vpid/"
    @end_url = "/mediaset/journalism-http-mobile"
  end
  
  def ContentApiClient asset_uri
    client = ContentApiClient.new
    asset = client.get_asset(asset_uri)
    if asset.video_href 
      response = get_raw(asset.video_href)
      playlist = Nokogiri::XML(response)
      vpid = playlist.xpath('//xmlns:playlist//xmlns:item//xmlns:mediator').attribute('identifier')
      video_img = playlist.xpath("//xmlns:playlist//xmlns:link[@rel='holding']").attribute('href')
      mediaselector = JSON.parse(get vpid)
      connections = mediaselector['media'].map { |m| m["connection"] }.flatten
      href = connections.select { |c| c["supplier"] == "sis_news_http" }.map { |c| c["href"] }.select { |h| h.include? "400" }.first
      Video.new href, video_img
    else
      Video.new nil, nil
    end
  end
  
  private
  
  def get vpid
    RestClient.get(@base_url + vpid + @end_url)
  end

  def get_raw url
    RestClient.get(url)
  end
end
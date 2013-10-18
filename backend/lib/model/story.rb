class Story
  def initialize data
    @data = data
    @url = @data["@id"]
    @asset_id = @url.split("/")[3..-1].join("/")
    client = JuicerClient.new
    if @url.include? "http://www.bbc.co.uk"
      article = client.get_article(@url)
      @asset = article["articles"].first
    end
  end
  
  def as_hash
    hash = {
      title: @data["title"],
      description: @data["description"],
      timestamp: @data["dateCreated"],
      type: @data["@type"],
      url: @url,
      asset_id: @asset_id,
    }
    if @asset && @asset["image"]
      hash[:image] = @asset["image"]["origin"]
    else
      hash[:image] = "http://news.bbcimg.co.uk/media/images/48351000/gif/_48351569_640x360-news.gif"
    end
    if @asset && @asset["format"]
      hash[:format] = @asset["format"]
      if @asset["format"] == "VideoFormat"
        video_client = VideoClient.new
        video_model = video_client.get_video(@asset_id)
        if video_model.href
          hash[:video] = video_model.href
        end
        if video_model.img
          hash[:image] = video_model.img
        end
      end
    end
    hash
  end
end
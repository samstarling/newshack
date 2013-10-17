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
      hash[:image] = @asset["image"]["src"]
    end
    if @asset && @asset["format"]
      hash[:format] = @asset["format"]
    end
    hash
  end
end
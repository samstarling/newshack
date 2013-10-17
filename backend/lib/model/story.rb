class Story
  def initialize data
    @data = data
    @url = @data["@id"]
    @asset_id = @url.split("/")[3..-1].join("/")
    client = ContentApiClient.new
    @asset = client.get_asset(@asset_id)
  end
  
  def as_hash
    {
      title: @data["title"],
      description: @data["description"],
      timestamp: @data["dateCreated"],
      type: @data["@type"],
      url: @url,
      asset_id: @asset_id,
      image: @asset.image
    }
  end
end
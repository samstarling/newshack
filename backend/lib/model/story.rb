class Story
  def initialize data
    @data = data
  end
  
  def as_hash
    {
      title: @data["title"],
      description: @data["description"],
      timestamp: @data["dateCreated"],
      type: @data["@type"],
      url: @data["@id"],
      asset_id: @data["@id"].split("/")[3..-1].join("/")
    }
  end
end
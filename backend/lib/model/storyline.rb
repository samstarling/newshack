class Storyline
  def initialize data
    @title = data["preferredLabel"]
    @dateCreated = data["dateCreated"]
  end
  
  def as_hash
    {
      title: @title,
      timestamp: @dateCreated
    }
  end
end
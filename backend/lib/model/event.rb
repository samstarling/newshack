class Event
  def initialize data
    @data = data
  end
  
  def as_hash
    {
      timestamp: @data["eventStartDate"],
      title: @data["preferredLabel"]
    }
  end
end
class Storyline
  def initialize data
    @title = data["preferredLabel"]
    @dateCreated = data["dateCreated"]
    @slots = data["hasSlot"]["@set"].map { |slot| slot["@id"] }
  end
  
  def as_hash
    {
      title: @title,
      timestamp: @dateCreated,
      slots: @slots
    }
  end
end
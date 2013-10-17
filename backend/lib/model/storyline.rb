require 'client/juicer_client'

class Storyline
  def initialize data
    @title = data.first["preferredLabel"]
    @dateCreated = data.first["dateCreated"]
    @slots = data.first["hasSlot"]["@set"].map do |uri|
      slot_id = data.select { |item| item["@id"] == uri["@id"] }.first["contains"]["@id"]
      slot_id
    end
    enrich_slots
  end
  
  def enrich_slots
    client = JuicerClient.new
    #@slots = @slots.map do |uri|
    #  client.get_event(uri)
    #end
  end
  
  def as_hash
    {
      title: @title,
      timestamp: @dateCreated,
      slots: @slots
    }
  end
end
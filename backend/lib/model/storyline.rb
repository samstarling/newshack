require 'client/juicer_client'
require 'model/event'

class Storyline
  def initialize data, show_empty=false
    @title = data.first["preferredLabel"]
    @dateCreated = data.first["dateCreated"]
    raw_slots = data.first["hasSlot"]["@set"].map do |uri|
      event_uri = data.select { |item| item["@id"] == uri["@id"] }.first["contains"]["@id"]
      event_data = data.select { |item| item["@id"] == event_uri }.first
      event = Event.new(event_data)
    end
    raw_slots = if show_empty == true
      raw_slots
    else
      raw_slots.select { |e| e.stories.empty? == false }
    end
    @slots = raw_slots.map { |e| e.as_hash }
  end
  
  def as_hash
    {
      title: @title,
      timestamp: @dateCreated,
      slots: @slots
    }
  end
end
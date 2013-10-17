require 'client/juicer_client'
require 'model/event'

class Storyline
  def initialize data
    @title = data.first["preferredLabel"]
    @dateCreated = data.first["dateCreated"]
    @slots = data.first["hasSlot"]["@set"].map do |uri|
      event_uri = data.select { |item| item["@id"] == uri["@id"] }.first["contains"]["@id"]
      event_data = data.select { |item| item["@id"] == event_uri }.first
      Event.new(event_data).as_hash
    end
  end
  
  def as_hash
    {
      title: @title,
      timestamp: @dateCreated,
      slots: @slots
    }
  end
end
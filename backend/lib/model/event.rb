require 'model/story'

class Event
  attr_reader :stories
  
  def initialize data
    @data = data
    @stories = if data["taggedOn"]
      if data["taggedOn"]["@set"]
        data["taggedOn"]["@set"].map { |story| Story.new(story) }
      else
        [Story.new(data["taggedOn"]), ]
      end
    else
      []
    end
  end
  
  def as_hash
    {
      timestamp: @data["eventStartDate"],
      title: @data["preferredLabel"],
      stories: @stories.map { |s| s.as_hash }
    }
  end
end
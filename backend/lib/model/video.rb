require 'client/juicer_client'
require 'model/event'

class Video
  attr_reader :href, :img
  
  def initialize uri, img
    @href = uri
    @img = img
  end
  
  def as_hash
    {
      href: @href,
      img: @img
    }
  end
end
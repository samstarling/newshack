#require 'summarize'
require 'nokogiri'

class ContentApi

    def initialize data
    @body = data['body']
    end

    def as_hash
    {
        body: @body
    }
    end
end
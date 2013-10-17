require 'nokogiri'

class ContentApi

    def initialize data
        @body = data['body']
        @summary = data['summary']
        @created = data['lastUpdated']
        @imagehref = data['media']['images']['index'].first[1]['href']
    end

    def as_hash
    {
        body: self.body(),
        summary: @summary,
        created: @created,
        image: @imagehref
    }
    end

    def body
        body = Nokogiri::XML(@body)
        paragraphs = body.xpath("//xmlns:paragraph")
        summary = ""
        paragraphs.each do |pg| 
            if pg.attribute('role') == nil
                summary = summary + pg.content + "\n"
            end
        end
        return summary
    end
end
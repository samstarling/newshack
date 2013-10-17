require 'nokogiri'

class CPSAsset
  attr_reader :image, :video_href, :data
  
  def initialize data
    @data = data
    @body = data['body']
    @summary = data['summary']
    @created = data['lastUpdated']
    @image = begin
      data['media']['images']['index'].first[1]['href']
    rescue
      nil
    end

    @video_href = begin
      videos = data['media']['videos']
      if videos
        if videos['body']
          videos['body'].first[1]['href']
        elsif videos['primary']
          videos['primary'].first[1]['href']
        end
      end
    rescue => e
      puts e
      nil
    end
  end

  def as_hash
    {
      body: self.body(),
      summary: @summary,
      created: @created,
      image: @image
    }
  end
  
  def paragraphs
    body = Nokogiri::XML(@body)
    paragraphs = body.xpath("//xmlns:paragraph").map { |p| p.text.to_s.strip }
  end

  def body
    summary = ""
    paragraphs.each do |pg| 
      if pg.attribute('role') == nil
        summary = summary + pg.content + "\n"
      end
    end
    return summary
  end
end
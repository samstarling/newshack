#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'

get '/storyline/:id' do
  {
    storyline: {
      title: "The Rise and Fall of Chris Huhne",
      synopsis: "foo",
      slots: {
        title: "Chris Huhne Trial",
        timestamp: "17 October 2013, 9:15am",
        items: [
          {
            type: "article",
            timestamp: "17 October 2013, 9:15am",
            title: "Chris Huhne jailed for ever and ever",
            synopsis: "The bad man was sent to jail today for 25 million years",
            author: "David Simkin",
            image: "http://news.bbcimg.co.uk/media/images/70520000/jpg/_70520991_68329107.jpg"
          }
        ]
      }
    }
  }.to_json
end

# type: article, audio, video, tweet, image

# storyline -> slot -> items
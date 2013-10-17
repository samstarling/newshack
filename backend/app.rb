#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'
require 'client/juicer_client'
require 'client/contentapi_client'

get '/storyline/:id' do
  client = JuicerClient.new
  storyline = client.get_storyline "4993e6b8-4214-44eb-9c66-67929058850f"
  storyline.as_hash.to_json
  #{
  #  storyline: {
  #    title: "The Rise and Fall of Chris Huhne",
  #    synopsis: "foo",
  #    slots: {
  #      title: "Chris Huhne Trial",
  #      timestamp: "17 October 2013, 9:15am",
  #      items: [
  #        {
  #          type: "article",
  #          timestamp: "17 October 2013, 9:15am",
  #          title: "Chris Huhne jailed for ever and ever",
  #          synopsis: "The bad man was sent to jail today for 25 million years",
  #          author: "David Simkin",
  #          image: "http://news.bbcimg.co.uk/media/images/70520000/jpg/_70520991_68329107.jpg"
  #        }
  #      ]
  #    }
  #  }
  #}.to_json
end

get '/summary/news/:id' do |id|
    client = ContentApiClient.new
    model = client.get_asset "news/#{id}"
    model.as_hash.to_json
end

# type: article, audio, video, tweet, image

# storyline -> slot -> items
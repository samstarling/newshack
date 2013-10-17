#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'
require 'client/juicer_client'
require 'client/contentapi_client'
require 'client/text_teaser_client'
require 'client/videoclient'

get '/storyline/:id' do
  content_type 'application/json'
  client = JuicerClient.new
  storyline = client.get_storyline(params[:id])
  storyline.as_hash.to_json
end

get '/summary/' do
  content_type 'application/json'
  client = VideoClient.new
  video_url = client.get_video "news/business-24562930"
end

# type: article, audio, video, tweet, image

# storyline -> slot -> items
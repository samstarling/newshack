#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'
require 'client/juicer_client'
require 'client/contentapi_client'

get '/storyline/:id' do
  # "4993e6b8-4214-44eb-9c66-67929058850f"
  client = JuicerClient.new
  storyline = client.get_storyline(params[:id])
  storyline.as_hash.to_json
end

get '/summary/news/:id' do |id|
  client = ContentApiClient.new
  model = client.get_asset "news/#{id}"
  model.as_hash.to_json
end

# type: article, audio, video, tweet, image

# storyline -> slot -> items
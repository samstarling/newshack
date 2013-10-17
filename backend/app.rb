#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'
require 'client/juicer_client'
require 'client/contentapi_client'

get '/storyline/:id' do
  content_type 'application/json'
  client = JuicerClient.new
  show_empty = false
  if params[:empty]
    show_empty = true
  end
  storyline = client.get_storyline(params[:id], show_empty)
  storyline.as_hash.to_json
end

get '/summary/news/:id' do |id|
  content_type 'application/json'
  client = ContentApiClient.new
  model = client.get_asset "news/#{id}"
  model.as_hash.to_json
end

get '/article' do
  content_type 'application/json'
  client = JuicerClient.new
  client.get_article(params[:url]).to_json
end

# type: article, audio, video, tweet, image

# storyline -> slot -> items
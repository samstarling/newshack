#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'json'
require 'memcachier'
require 'dalli'

require 'client/juicer_client'
require 'client/contentapi_client'
require 'client/text_teaser_client'
require 'client/video_client'

set :cache, Dalli::Client.new(ENV["MEMCACHIER_SERVERS"],
                  {:username => ENV["MEMCACHIER_USERNAME"],
                   :password => ENV["MEMCACHIER_PASSWORD"]})

get '/cachetest' do
  settings.cache.set('color', 'blue')
  settings.cache.get('color')
end

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

get '/summary/' do
  content_type 'application/json'
  client = VideoClient.new
  video_url = client.get_video "news/business-24562930"
end

get '/article' do
  content_type 'application/json'
  client = JuicerClient.new
  client.get_article(params[:url]).to_json
end

#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'storyline'

get '/' do
  @title = 'Storylines' 
  erb :index
end

get '/storylines/:id' do
  fixtures = params[:fixtures]
  storyline = Storyline.new(params[:id], fixtures)
  @title = storyline.raw['title']
  @events = storyline.raw['slots']
  erb :storyline
end

get '/test/unit' do
  erb :jasmine, :layout => false
end
#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'

get '/' do
  @title = 'Storylines' 
  erb :index
end

get '/test/unit' do
  erb :jasmine, :layout => false
end
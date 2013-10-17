#! /usr/bin/env ruby

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'

get '/' do
  "This is the backend app"
end

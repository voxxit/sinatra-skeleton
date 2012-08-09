require "rubygems"
require "bundler"

Bundler.require

require "./app"

map "/assets" do
  run App.settings.sprockets
end

map "/" do
  run App
end
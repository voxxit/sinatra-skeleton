require "rubygems"
require "bundler"

Bundler.require

require "./app"

map "/assets" do
  env = Sprockets::Environment.new

  env.append_path "assets/javascripts"
  env.append_path "assets/stylesheets"
  
  run env
end

map "/" do
  run App
end
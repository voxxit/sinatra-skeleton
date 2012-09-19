class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end

module Sinatra
  module AssetHelpers
    def stylesheets_tag(name = "application")
      env = ENV['RACK_ENV']
      
      if env and env == "production" or env == "staging"
        "<link rel=\"stylesheet\" href=\"/assets/#{name}.min.css\" type=\"text/css\" />"
      else
        "<link rel=\"stylesheet\" href=\"/assets/#{name}.css\" type=\"text/css\" />"
      end
    end

    def javascripts_tag(name = "application")
      env = ENV['RACK_ENV']

      if env and env == "production" or env == "staging"
        "<script src=\"/assets/#{name}.min.js\"></script>"
      else
        "<script src=\"/assets/#{name}.js\"></script>"
      end
    end
  end
end
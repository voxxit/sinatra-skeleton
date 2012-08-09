module Sinatra
  module AssetHelpers
    def stylesheets_tag
      if production?
        '<link rel="stylesheet" href="/assets/application.min.css" type="text/css" />'
      else
        '<link rel="stylesheet" href="/assets/application.css" type="text/css" />'
      end
    end

    def javascripts_tag
      if production?
        '<script src="/assets/application.min.js"></script>'
      else
        '<script src="/assets/application.js"></script>'
      end
    end
  end
end
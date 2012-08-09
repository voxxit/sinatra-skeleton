require 'rubygems'
require 'bundler'

Bundler.require

require './app'

namespace :assets do
  desc 'Precompile stylesheets and javascripts'
  task :precompile do
    sprockets = App.settings.sprockets
    
    {"javascripts" => "js", "stylesheets" => "css"}.each do |folder, extension|
      asset   = sprockets["application.#{extension}"]
      outpath = File.join(App.settings.assets_path, folder)
      outfile = Pathname.new(outpath).join("application.min.#{extension}")
    
      FileUtils.mkdir_p outfile.dirname

      asset.write_to(outfile)
      asset.write_to("#{outfile}.gz")
    end
  end
end

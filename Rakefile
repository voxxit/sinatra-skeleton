require 'rubygems'
require 'bundler'

Bundler.require

require './app'

namespace :assets do
  desc 'Precompile stylesheets and javascripts'
  task :precompile do
    sprockets = App.settings.sprockets
    
    %w(application).each do |file|
      {"javascripts" => "js", "stylesheets" => "css"}.each do |folder, extension|
        asset   = sprockets["#{file}.#{extension}"]
        outpath = File.join(App.settings.assets_path, folder)
        outfile = Pathname.new(outpath).join("#{file}.min.#{extension}")
      
        FileUtils.mkdir_p outfile.dirname

        asset.write_to(outfile)
        asset.write_to("#{outfile}.gz")
      end
    end
  end
end

namespace :db do
  desc 'Migrate the databasee'
  task :migrate do
    DataMapper.auto_migrate!
  end

  desc 'Upgrade the databasee'
  task :upgrade do
    DataMapper.auto_upgrade!
  end

  desc 'Migrate the database, and add the seed data'
  task :reset do
    DataMapper.auto_migrate!

    # Use this space to seed your database as necessary.
  end
end
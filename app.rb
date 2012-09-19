CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config.yml")[ENV['RACK_ENV'] || "development"]

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/app_development")

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |model| require model }

require './helpers'

class App < Sinatra::Base
  # If you run into issues with click-jacking (like with Facebook
  # Canvas apps), or with CSRF issues, you may want to disable
  # sinatra-contrib's default protection:
  #
  # disable :protection

  set :root, File.dirname(__FILE__)
  set :sprockets, (Sprockets::Environment.new(root) { |env| env.logger = Logger.new(STDOUT) })
  set :assets_path, File.join(root, 'assets')
  set :environments, %w{development staging production}

  # If you're writing a Facebook application which requires AJAX requests
  # (such as submitting a form, or downloading JSON data), you're going to want to
  # uncomment the following block:
  #
  # before do
  #   headers["P3P"] = 'CP="IDC DSP COR CURa ADMa OUR IND PHY ONL COM STA"'
  # end

  configure do
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'javascripts')
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers Sinatra::AssetHelpers

  get "/" do
    haml :index
  end
end

DataMapper.finalize
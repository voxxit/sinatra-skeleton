DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "mysql://localhost/app_development")

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |model| require model }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    # ...
  end
end

DataMapper.finalize
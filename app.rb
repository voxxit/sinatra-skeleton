DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "mysql://localhost/app_development")

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    # ...
  end
end

DataMapper.finalize
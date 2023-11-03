require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
end

class Application
  get '/' do
    "Hello World"
  end

  get '/hello' do
    name = params[:name]
    return "Hello #{name}!"
  end

  post '/posts' do
    return 'post was created'
  end
end
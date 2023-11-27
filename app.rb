# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# This allows the app code to refresh
# without having to restart the server.
class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end

# Trying endpoints
class Application
  get '/' do
    'Hello World'
  end

  get '/hello' do
    name = params[:name]
    return "Hello #{name}!"
  end

  post '/posts' do
    return 'post was created'
  end
end

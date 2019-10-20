require 'bundler'
require 'sinatra/base'
require 'sinatra/json'

Bundler.require(:default)

Mongoid.load!('config/mongoid.yml')
require_relative 'models/init'


class App < Sinatra::Application
  get '/' do
    json :message => "Hello World"
  end
end


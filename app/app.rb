

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end
end

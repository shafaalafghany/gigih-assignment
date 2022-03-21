require 'sinatra'
require_relative 'config'

get '/item' do
  erb :items
end

post '/item' do
  name = params[:name]
  category = params[:category]
  price = params[:price]
  data = {
    :name => name,
    :category => category,
    :price => price,
  }
  erb :item_detail, locals: {
    data: data
  }
end
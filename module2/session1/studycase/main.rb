require 'sinatra'

get '/' do
  erb :index
end

post '/order' do
  name = params[:name]
  address = params[:address]
  food_name = params[:food]
  food_quantity = params[:foodqty].to_i
  drink_name = params[:drink]
  drink_quantity = params[:drinkqty].to_i

  total_price = (20 * food_quantity) + (10 * drink_quantity)
  data = {
    :name => name,
    :address => address,
    :food => food_name,
    :food_quantity => food_quantity,
    :drink => drink_name,
    :drink_quantity => drink_quantity,
    :total_price => total_price
  }

  erb :result, locals: {
    data: data
  }
end
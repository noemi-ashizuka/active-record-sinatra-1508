require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

get "/" do
  @restaurants = Restaurant.all # array of instances
  erb :index
end

get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/" 
end


# HTTP VERBS

# GET (to get some data)
# POST (to create/add something)
# PUT/PATCH (to update)
# DELETE (to delete)

require './app'
require_relative 'routes/restaurant_route.rb'


use RestaurantRoute
run App
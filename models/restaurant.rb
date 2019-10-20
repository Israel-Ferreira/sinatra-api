class Restaurant
  include Mongoid::Document

  field :restaurant_id, type: String 
  field :name, type: String 
  field :longitude, type: String
  field :latitude, type: String
  field :address, type: String 
end
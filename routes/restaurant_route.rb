class RestaurantRoute < Sinatra::Application

  get '/restaurants' do
    @restaurants = Restaurant.all 
    json  @restaurants
  end

  get '/restaurants/:id' do
    set_restaurant
    json  @restaurant
  end


  post '/restaurants' do

    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      json  :message => "Restaurante criado com sucesso", :data => @restaurant
    else
      json :message => "Falha ao cadastrar o restaurante"
    end
  end

  put '/restaurants/:id' do
    set_restaurant

    if @restaurant.update(restaurant_params)
      json :message => "Restaurante Atualizado com sucesso"
    else
      json  :message => "Falha ao atualizar o restaurante"
    end
  end

  delete '/restaurants/:id' do
    set_restaurant
    @restaurant.destroy
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    JSON.parse(request.body.read)
  end
end
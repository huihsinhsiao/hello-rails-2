Rails.application.routes.draw do
  # get '/restaurants', to: 'a#b'
  get '/restaurants', to: 'restaurants#index'
  get '/new_restaurant', to: 'restaurants#new'
  post '/restaurant_list', to: 'restaurants#list'

	get '/restaurant/about', to: 'restaurants#origin'
end

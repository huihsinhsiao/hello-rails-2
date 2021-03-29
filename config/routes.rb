Rails.application.routes.draw do
  # get '/restaurants', to: 'a#b'
  get '/restaurants', to: 'restaurants#index'
end

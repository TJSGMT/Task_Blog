Rails.application.routes.draw do
 resources :posts
 post '/login', to: 'sessions#create'
 post '/register', to: 'users#create'
end

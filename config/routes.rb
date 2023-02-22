Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :rooms, param: :access_key, only: [:show], constraints: { access_key: /[a-fA-F0-9]+/ } do 
    post 'videos', to: 'videos#create', as: 'videos_by_access_key'
  end
  
  resources :rooms do
    resources :videos, only: [:destroy]
    get 'videos'
  end
  
  # Access room from access_key
  get '/rooms/:access_key', to: 'rooms#show', as: 'room_by_access_key'
  
end

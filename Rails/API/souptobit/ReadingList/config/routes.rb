Rails.application.routes.draw do
  namespace :api do
  	resources :books, only: [:index, :create, :destroy] #except: [:destroy, :update]
  	resources :finished_books
  	resources :genres
  end
  
  root to: 'home#show'
end

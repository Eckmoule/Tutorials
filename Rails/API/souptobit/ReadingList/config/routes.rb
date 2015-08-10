Rails.application.routes.draw do
  resources :books, only: [:index, :create, :destroy] #except: [:destroy, :update]
  resources :finished_books
  resources :genres
end

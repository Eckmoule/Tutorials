Rails.application.routes.draw do
  resources :books, only: [:index, :create] #except: [:destroy, :update]
  resources :finished_books
end

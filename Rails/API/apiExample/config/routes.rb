Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :zombies
    resources :humans
    resources :episodes
    resources :users
  end 

 

end

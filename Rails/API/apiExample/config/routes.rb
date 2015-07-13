Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :zombies
  end 

end

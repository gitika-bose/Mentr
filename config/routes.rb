Rails.application.routes.draw do

  root 'users#profile'
  
  resources :catalog do
  end

  get 'homepage/index'

  devise_for :users
  resources :users do
    # modify to using match,
    # to & as for REST
    get 'profile'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

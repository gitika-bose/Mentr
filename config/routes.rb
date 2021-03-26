Rails.application.routes.draw do
  get '/catalog', to: 'catalog#index'
  get 'homepage/index'
  root 'users#profile'
  devise_for :users
  resources :users do
    # modify to using match,
    # to & as for REST
    get 'profile'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

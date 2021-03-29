Rails.application.routes.draw do
  root 'homepage#index'
  get 'mentors/new'
  get 'mentors/edit'
  
  resources :mentors do
  end
  
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

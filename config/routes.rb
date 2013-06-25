Tmangr::Application.routes.draw do

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :users, only: [:index]
    end
  end

  resources :home, only: [:index]

  root :to => 'home#index'
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers, only: [:show] do
        resources :subscriptions, only: [:create, :destroy]
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get 'booking/create'
  get 'cars/index'
  get 'cars/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars, only: %i[index show] do
    resources :bookings, only: [:create]
  end
end

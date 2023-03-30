Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cars, only: %i[index show new create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: %i[index update]
  get "my_cars", to: "cars#my_cars"
end

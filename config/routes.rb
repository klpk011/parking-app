Rails.application.routes.draw do
  devise_for :users
  resources :parkings
  root 'parkings#new'
end

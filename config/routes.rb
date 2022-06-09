Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  get 'home/index'
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

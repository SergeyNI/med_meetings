Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins, ActiveAdmin::Devise.config 
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  ActiveAdmin.routes(self)
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


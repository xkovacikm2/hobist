Rails.application.routes.draw do
  #static pages
  root 'static#home'

  #users
  devise_for :users, controllers: {registrations: 'registrations'}

  #posts
  resources :posts
end

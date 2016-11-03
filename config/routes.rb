Rails.application.routes.draw do
  #static pages
  root 'static#home'

  #users
  devise_for :users, controllers: {registrations: 'registrations'}
  get 'posts/autocomplete_user_name'

  #posts
  resources :posts
end

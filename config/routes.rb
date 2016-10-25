Rails.application.routes.draw do
  #users
  devise_for :users, controllers: {registrations: 'registrations'}

  #static pages
  root 'static#home'
end

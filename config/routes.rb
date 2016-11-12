Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  #static pages
  root 'static#home'

  #users
  devise_for :users, controllers: {registrations: 'registrations'}

  #posts
  post 'posts/add_attendant'
  delete 'posts/remove_attendant'
  get 'posts/autocomplete_user_name'
  get 'posts/autocomplete_city_name'
  get 'posts/invite'
  post 'posts/send_invitation'
  resources :posts
end

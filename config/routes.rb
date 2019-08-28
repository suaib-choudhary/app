Rails.application.routes.draw do
  # get 'authors/index'
  # get 'authors/new'
  # get 'authors/create'
  # get 'authors/update'
  # get 'authors/destroy'
  # get 'books/index'
  # get 'books/new'
  # get 'books/create'
  # get 'books/update'
  # get 'books/destroy'
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

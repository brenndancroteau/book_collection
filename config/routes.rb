Rails.application.routes.draw do

  # root "books#index"

  # get 'main/index'
  
  # resources :books do
  #   member do
  #     get :delete
  #   end
  # end

  resources :books
  root 'books#index'

end

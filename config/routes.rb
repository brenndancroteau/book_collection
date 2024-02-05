Rails.application.routes.draw do

  get 'main/index'
  
  # resources :books do
  #   member do
  #     get :delete
  #   end
  # end

  resources :books
  root 'books#index'

end

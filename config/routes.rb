Rails.application.routes.draw do

  root "books#index"

  get 'main/index'

  # get 'books/index'
  # get 'books/create'
  # get 'books/read'
  # get 'books/update'
  # get 'books/delete'
  
  resources :books do
    member do
      get :delete
    end
  end

end

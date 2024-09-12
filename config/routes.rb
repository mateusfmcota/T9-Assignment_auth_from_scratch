Rails.application.routes.draw do
  get "/registration", to: "registrations#new", as: :sign_up
  post "/registration", to: "registrations#create", as: :registration
  delete "/sign_out", to: "sessions#destroy", as: :sign_out
  get "/sign_in", to: "sessions#new", as: :sign_in
  post "/sign_in", to: "sessions#create", as: :sign_in_create
  root "site#index"

  get '/password', to: 'password#edit'
  post '/password', to: 'password#create'

  get '/password_edit/:id', to: 'password#new', as: 'new_password'
  put '/password_update/:id', to: 'password#update', as: 'update_password'
end

Rails.application.routes.draw do
  devise_for :users
  
  root to:"feedbacks#index"
  get "/new", to:"feedbacks#new"
  post "/create", to:"feedbacks#create"
  delete "/feedbacks/:id", to:"feedbacks#destroy"
  get "/feedbacks/:id/edit", to:"feedbacks#edit"
  patch "/feedbacks/:id", to:"feedbacks#update" 
  get "/feedbacks/users/:id", to:"feedbacks#show"
  get "/feedbacks/favorites/:id", to:"feedbacks#favorite"
  
  resources :feedbacks do
    resource :favorites, only: [:create, :destroy]
  end
end

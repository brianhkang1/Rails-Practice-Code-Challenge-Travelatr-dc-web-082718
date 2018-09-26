Rails.application.routes.draw do
  resources :bloggers, only: [:create, :new, :show]
  resources :posts, only: [:show, :new, :create, :edit, :update]
  resources :destinations, only: [:show]
end

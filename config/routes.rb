Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:destroy, :new, :create]
  resources :subs do
    resources :posts, only: [:new]
  end
  resources :posts, except: [:new, :index]
end

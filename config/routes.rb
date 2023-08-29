Rails.application.routes.draw do
  get 'main/homepage'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#homepage"
  resources :notifications, only: [:index]
  get '/:id', to: 'users#show', as: :profile
  resources :users, only: [:show] do
    member do
      post 'send_friend_request', to: 'users#send_friend_request', as: :send_friend_request
      post 'accept_friend_request', to: 'users#accept_friend_request', as: :accept_friend_request
      post 'decline_friend_request', to: 'users#decline_friend_request', as: :decline_friend_request
      delete 'cancel_friend_request', to: 'users#cancel_friend_request', as: :cancel_friend_request
    end
  end
  resources :notifications, only: [] do
    member do 
      patch :accept_friend_request
      delete :decline_friend_request
    end
  end


  resources :posts do
    member do
      post 'like'
      post 'unlike'
    end
    resources :comments, only: [:create]
  end

end


Bloccit::Application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users, only: [:show]

  resources :topics do
    resources :posts, except: [:index] do
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      match "/up_vote", to: 'votes#up_vote', as: :up_vote
      match "/down_vote", to: 'votes#down_vote', as: :down_vote
    end
  end  

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
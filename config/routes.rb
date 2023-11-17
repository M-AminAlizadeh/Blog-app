Rails.application.routes.draw do
Rails.application.routes.draw do
  devise_for :users
  devise_for :users
  devise_scope :user do
  devise_scope :user do
    authenticated :user do
    authenticated :user do
      root :to => 'users#index', as: :authenticated_root
      root :to => 'users#index', as: :authenticated_root
    end
    end
    unauthenticated :user do
    unauthenticated :user do
      root :to => 'pages#login', as: :unauthenticated_root
      root :to => 'login#index', as: :unauthenticated_root
    end
    end
  end
  end

  get '/login', to: 'pages#login'
  get '/login', to: 'login#index'
  resources :users, only: [:index, :show] do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
      resources :likes, only: [:create]
    end
    end
  end
  end
end
end

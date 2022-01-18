Rails.application.routes.draw do
  root 'static_pages#top'
  resources :services, only: [:index, :show] do
    resources :reviews, only: [:create] do
      resources :review_likes, only: [:create, :destroy]
    end
    resources :menus, only: [:index] do
      resources :menu_likes, only: [:create, :destroy]
    end
  end
  resources :users, only: [:new, :create]
  resource :profile, only: [:show, :edit, :update]
  get 'all_menus', to: 'menus#all_menus'
  get 'menu_rank', to: 'menus#menu_rank'
  get 'service_rank', to: 'services#service_rank'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
end

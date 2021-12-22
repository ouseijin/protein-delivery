Rails.application.routes.draw do
  root 'static_pages#top'
  resources :services, only: [:index, :show] do
    resources :menus, only: [:index]
    resources :reviews, only: %i[create], shallow: true
  end
  resources :users, only: [:new, :create]
  resource :profile, only: [:show, :edit, :update]
  get 'all_menus', to: 'menus#all_menus'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
end

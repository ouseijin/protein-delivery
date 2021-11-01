Rails.application.routes.draw do
  root 'static_pages#top'
  resources :services, only: [:index, :show]
end

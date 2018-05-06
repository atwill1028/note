Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "contributes#index"
  resources :contributes, only: [:index, :new, :create] do
    collection do
      resources :manga, only: [:index]
      resources :column, only: [:index]
      resources :novel, only: [:index]
      resources :photo, only: [:index]
      resources :music, only: [:index]
      resources :business, only: [:index]
      resources :lifestyle, only: [:index]
      resources :tech, only: [:index]
      resources :entertainment, only: [:index]
      resources :pickup, only: [:index]
      resources :categories, only: [:index]
      resources :hashtag, only: [:index]
      resources :help, only: [:index]
    end
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "contributes#index"
  resources :contributes, only: [:index, :new, :create] do
    resources :contribute_likes, only: [:create, :destroy]
    collection do
      resources :mangas, only: :index
      resources :columns, only: :index
      resources :novels, only: :index
      resources :photos, only: :index
      resources :musics, only: :index
      resources :businesses, only: :index
      resources :lifestyles, only: :index
      resources :techs, only: :index
      resources :entertainments, only: :index
      resources :pickups, only: :index
      resources :categories, only: :index
      resources :hashtags, only: :index
      resources :helps, only: :index
    end
  end
  resources :users, only: [:index, :show]
end

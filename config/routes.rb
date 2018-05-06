Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "contributes#index"
  resources :contributes, only: [:index, :new, :create] do
    collection do
      get :manga
      get :column
      get :novel
      get :photo
      get :music
      get :business
      get :lifestyle
      get :tech
      get :entertainment
      get :pickup
      get :categories
      get :hashtag
      get :help
    end
  end
end

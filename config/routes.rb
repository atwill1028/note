Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "contributes#index"
  resources :contributes, only: [:index]
  get "contributes/manga" => "contributes#manga"
  get "contributes/column" => "contributes#column"
  get "contributes/novel" => "contributes#novel"
  get "contributes/photo" => "contributes#photo"
  get "contributes/music" => "contributes#music"
  get "contributes/business" => "contributes#business"
  get "contributes/lifestyle" => "contributes#lifestyle"
  get "contributes/tech" => "contributes#tech"
  get "contributes/entertainment" => "contributes#entertainment"
  get "contributes/pickup" => "contributes#pickup"
  get "contributes/categories" => "contributes#categories"
  get "contributes/hashtag" => "contributes#hashtag"
  get "contributes/help" => "contributes#help"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

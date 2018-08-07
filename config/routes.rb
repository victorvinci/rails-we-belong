Rails.application.routes.draw do
  get 'searches/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: %i[index show] do
    resources :reviews, only: %i[index show new create] do
      resources :answers, only: %i[show new create]
    end
  end
end

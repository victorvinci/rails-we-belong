Rails.application.routes.draw do
  get 'searches/index'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: %i[index show] do
    resources :reviews, only: %i[index new create] do
      resources :answers, only: %i[show new create]
      resources :votes, only: %i[show new create]
    end
  end
  resources :reviews, only: :show do
    resources :votes, only: %i[show new create]
  end
  resources :employee_profiles, except: :index
end

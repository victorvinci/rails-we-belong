Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: %i[index show] do
    resources :reviews, only: %i[index show new create]
  end
end

  # resources :pets do
  #   resources :bookings, except: %i[index destroy] do
  #     resources :reviews, except: %i[index destroy]
  #   end
  # end

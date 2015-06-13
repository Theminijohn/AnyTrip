Rails.application.routes.draw do

  devise_scope :user do
    authenticated do
      root 'pages#home'
    end
    unauthenticated do
      root 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  devise_for :users, path: 'u',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    },
    controllers: {
    	registrations: 'registrations'
    }

  get 'u/:id' => 'users#show', as: :user

  resources :trips

  resources :airports, only: [:index, :show]

end

Rails.application.routes.draw do
  get 'users/show'

  resources :trips
  root 'pages#home'

  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    },
    controllers: {
    	registrations: 'registrations'
    }

  get 'users/:id' => 'users#show', as: :user 

end

Rails.application.routes.draw do
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

end

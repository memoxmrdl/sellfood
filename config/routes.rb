Sellfood::Application.routes.draw do
  
  devise_for :users,
    :controllers => {
      :registrations => 'registrations',
      :sessions => 'sessions',
      :omniauth_callbacks => "omniauth_callbacks"
    }

  resources :after_signup

  root 'home#index'
end
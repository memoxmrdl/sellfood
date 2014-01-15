Sellfood::Application.routes.draw do
  devise_for :users, 
             :path => '', 
             :controllers => { omniauth_callbacks: "omniauth_callbacks" }

  root 'home#index'
end
Raie::Application.routes.draw do
  root 'yourfiles#index'
  resources :yourfiles
  devise_for :users
end

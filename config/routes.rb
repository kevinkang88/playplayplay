PLAYLTICS::Application.routes.draw do
  devise_for :users
  resources :dashboard
  root :to => "pages#main"
end

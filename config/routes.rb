PLAYLTICS::Application.routes.draw do
  devise_for :users
  resources :dashboard, only:[:index]
  get '/tracks/search', to: 'tracks#search', as: 'search'
  root :to => "pages#main"
end

PLAYLTICS::Application.routes.draw do
  devise_for :users
  resources :dashboard, only:[:index]
  resources :tracks, only:[:create]
  get '/tracks/search', to: 'tracks#search', as: 'search'
  get '/tracks/result', to: 'tracks#result', as: 'result'

  root :to => "pages#main"
end

PLAYLTICS::Application.routes.draw do
  devise_for :users
  resources :dashboard, only:[:index]
  resources :tracks, only:[:create]
  resources :playlists, only:[:new,:index,:show,:edit,:destroy]
  post 'playlists/update', to: 'playlists#update', as: 'update_track'
  post 'playlists/add', to: 'playlists#add', as: 'add_track'
  get '/tracks/search', to: 'tracks#search', as: 'search'
  get '/tracks/result', to: 'tracks#result', as: 'result'

  root :to => "pages#main"
end

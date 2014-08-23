PLAYLTICS::Application.routes.draw do
  devise_for :users
  resources :dashboard, only:[:index]
  get '/dashboard/search', to: 'dashboard#search', as: 'search'
  root :to => "pages#main"
end

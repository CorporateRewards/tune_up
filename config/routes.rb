Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}
  devise_for :admins, :controllers => { sessions: 'admins/sessions'}

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
  get "/pages/:page" => "pages#show"

  resource :search, only: [:show]
  resources :tracks do
    member do
      post :add_a_track
    end
    resources :votes
  end

  resources :playlists
  resources :players
  get 'sign_in', to: 'pages#sign_in'
  get 'index', to: 'pages#index'
  get 'stats', to: 'stats#show'
  get 'spotify', to: 'pages#spotify'
  get 'update_playlist', to: 'tracks#update_playlist'
  get '/auth/spotify/callback', to: 'spotify_auths#spotify'
  get 'welcome', to: 'pages#welcome'
  resource :nicknames
  get 'currently_playing', to: 'application#currently_playing'
  get 'player_control', to: 'players#update'
  get 'pause_tracks', to: 'tracks#pause_tracks'
  get 'play_individual_track', to: 'tracks#play_individual_track'
  get 'navigate_track', to: 'tracks#navigate_track'
  get 'volume_control', to: 'tracks#volume_control'
  get 'track_details', to: 'tracks#track_details'
  get 'device_list', to: 'tracks#device_list'
  get 'progress', to: 'application#track_progress'
  get 'my_activity', to: 'users/users#user_votes'
  get 'update_active_track', to: 'tracks#update_active_track'

end

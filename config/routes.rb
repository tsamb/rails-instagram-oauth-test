Rails.application.routes.draw do
  root to: 'welcome#welcome'
  get 'oauth_connect' => 'users#oauth_connect', as: 'instagram_oauth'
  get 'oauth_callback' => 'users#oauth_callback'
  get 'logout' => 'users#logout', as: 'logout'
end

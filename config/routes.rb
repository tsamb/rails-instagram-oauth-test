Rails.application.routes.draw do
  root to: 'welcome#welcome'
  get 'oauth_connect' => 'users#oauth_connect'
  get 'oauth_callback' => 'users#oauth_callback'
end

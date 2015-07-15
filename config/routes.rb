Rails.application.routes.draw do
  get 'oauth_connect' => 'users#oauth_connect'
  get 'oauth_callback' => 'users#oauth_callback'
end

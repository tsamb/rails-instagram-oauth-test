class UsersController < ApplicationController
  def oauth_connect
    redirect_to Instagram.authorize_url(:redirect_uri => "http://localhost:3000/oauth_callback")
  end

  def oauth_callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => "http://localhost:3000/oauth_callback")
    @user = User.find_by(instagram_token: response.access_token)
    @user = User.create(instagram_token: response.access_token) unless @user
    raise @user.inspect
  end
end

class UsersController < ApplicationController
  def oauth_connect
    redirect_to Instagram.authorize_url(:redirect_uri => "https://floating-wave-4718.herokuapp.com/oauth_callback")
  end

  def oauth_callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => "https://floating-wave-4718.herokuapp.com/oauth_callback")
    @user = User.find_by(instagram_token: response.access_token)
    @user = User.create(instagram_token: response.access_token) unless @user
    session[:user_id] = @user.id
    render :index
  end

  def logout
    session.clear
    redirect_to root_path
  end
end

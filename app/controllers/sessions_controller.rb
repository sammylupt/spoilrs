class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by_omniauth(env["omniauth.auth"])

    if @user
      session[:token] = @user.token
      session[:secret] = @user.secret
      redirect_to new_post_path
      # TODO redirect
    else
      # TODO
    end
  end

  def destroy
  end
end

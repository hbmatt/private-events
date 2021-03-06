class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end

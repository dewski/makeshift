class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    @user = User.find_or_create_from_github(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

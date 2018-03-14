module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :require_current_user
  end

  def require_current_user
    current_user || redirect_to_github_authentication
  end

  def redirect_to_github_authentication
    redirect_to '/auth/github'
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def current_user?
    current_user.present?
  end
end

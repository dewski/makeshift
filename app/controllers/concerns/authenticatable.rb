module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
    def authenticate
      if authenticated_user = User.find_by(id: cookies.encrypted[:user_id])
        Current.user = authenticated_user
      else
        redirect_to_github_authentication
      end
    end

    def redirect_to_github_authentication
      redirect_to '/auth/github'
    end

    def current_user=(user)
      cookies.encrypted[:user_id] = user.id
      Current.user = user
    end
end

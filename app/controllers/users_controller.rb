class UsersController < ApplicationController
  skip_before_action :verify_user_connected_to_pagerduty

  def index
    @users = Makeshift.pagerduty.users
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)

    respond_to do |format|
      format.html { redirect_back fallback_location: users_path }
      format.js { head :ok }
    end
  end

  private
    def user_params
      params.require(:user).permit(:pagerduty_uid)
    end
end

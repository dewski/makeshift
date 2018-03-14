class ScheduleInvitationsController < ApplicationController
  def create
    schedule = Schedule.find(params[:schedule_id])
    user = User.find(invitation_params[:user_id])
    schedule.invite(user)

    respond_to do |format|
      format.html { redirect_back fallback_location: schedule }
      format.js
    end
  end

  private
    def invitation_params
      params.require(:invitation).permit(:user_id)
    end
end

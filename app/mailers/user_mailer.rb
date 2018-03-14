class UserMailer < ApplicationMailer
  def schedule_invitation(invitation)
    @creator = invitation.creator
    @user = invitation.user
    @schedule = invitation.schedule

    mail(
      title: "[Makeshift] Invitation to join #{@schedule.name}",
      to: @user.email,
    )
  end
end

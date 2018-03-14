# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/schedule_invitation
  def schedule_invitation
    UserMailer.schedule_invitation(ScheduleInvitation.last)
  end

end

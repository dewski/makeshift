class ScheduleInvitation < ApplicationRecord
  belongs_to :creator
  belongs_to :user
  belongs_to :schedule

  before_create do
    self.creator = Current.user
  end

  after_commit :deliver_schedule_invitation_email, on: :create

  private
    def deliver_schedule_invitation_email
      UserMailer.schedule_invitation(self).deliver_later
    end
end

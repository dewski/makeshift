class ScheduleInvitation < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :user
  belongs_to :schedule

  validates :creator, presence: true
  validates :user, presence: true
  validates :schedule, presence: true

  before_validation(on: :create) do
    self.creator = Current.user
  end

  after_commit :deliver_schedule_invitation_email, on: :create

  private
    def deliver_schedule_invitation_email
      UserMailer.schedule_invitation(self).deliver_later
    end
end

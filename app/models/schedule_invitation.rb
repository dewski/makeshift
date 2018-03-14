class ScheduleInvitation < ApplicationRecord
  belongs_to :creator
  belongs_to :user
  belongs_to :schedule

  before_create do
    self.creator = Current.user
  end
end

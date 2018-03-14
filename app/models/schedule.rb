class Schedule < ApplicationRecord
  has_many :invitations, class_name: 'ScheduleInvitation', dependent: :destroy

  def self.import(pagerduty_id)
    where(pagerduty_id: pagerduty_id).first_or_create do |schedule|
      remote_schedule = Makeshift.pagerduty.schedule(pagerduty_id)
      if remote_schedule.ok?
        schedule.name = remote_schedule.value!.dig("schedule", "name")
      end
    end
  end

  def invite(user)
    invitations.where(user: user).first_or_create
  end
end

class Schedule < ApplicationRecord
  has_many :invitations, class_name: 'ScheduleInvitation', dependent: :destroy
end

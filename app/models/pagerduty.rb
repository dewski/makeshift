class Pagerduty
  include HTTParty
  base_uri 'https://api.pagerduty.com'

  def initialize(token)
    @token = token
  end

  def users
    GitHub::Result.new {
      users = api('/users')

      pagerduty_uids = users['users'].map { |user| user['id'] }
      existing_users = User.where(pagerduty_uid: pagerduty_uids).map do |user|
        [user.pagerduty_uid, user]
      end
      existing_users_table = Hash[existing_users]

      users['users'].map do |user|
        existing_users_table.fetch(user['id']) {
          Pagerduty::WrappedUser.new(user)
        }
      end
    }
  end

  def schedules
    GitHub::Result.new {
      schedules = api('/schedules')

      pagerduty_ids = schedules['schedules'].map { |schedule| schedule['id'] }
      existing_schedules = Schedule.where(pagerduty_id: pagerduty_ids).map do |schedule|
        [schedule.pagerduty_id, schedule]
      end
      existing_schedules_table = Hash[existing_schedules]

      schedules['schedules'].map do |schedule|
        existing_schedules_table.fetch(schedule['id']) {
          Pagerduty::WrappedSchedule.new(schedule)
        }
      end
    }
  end

  private
    def api(path)
      self.class.get(path, headers: {
        'Authorization' => "Token token=#{@token}",
        'Accept' => 'application/vnd.pagerduty+json;version=2',
      })
    end
end

class Pagerduty
  include HTTParty
  base_uri 'https://api.pagerduty.com'

  def initialize(token)
    @token = token
  end

  def users
    GitHub::Result.new {
      users = self.class.get('/users', headers: {
        "Authorization" => "Token token=#{@token}",
        "Accept" => "application/vnd.pagerduty+json;version=2",
      })

      pagerduty_uids = users["users"].map { |user| user["pagerduty_uid"] }
      existing_users = User.where(pagerduty_uid: pagerduty_uids).group_by(&:pagerduty_uid)

      users["users"].map do |user|
        existing_users.fetch(user["pagerduty_uid"]) {
          Pagerduty::WrappedUser.new(user)
        }
      end
    }
  end
end

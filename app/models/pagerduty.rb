class Pagerduty
  include HTTParty
  base_uri 'https://api.pagerduty.com'

  def initialize(token)
    @token = token
  end

  def users
    self.class.get('/users', headers: {
      "Authorization" => "Token token=#{@token}",
      "Accept" => "application/vnd.pagerduty+json;version=2",
    })
  end
end

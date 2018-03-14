module Makeshift
  def self.pagerduty
    return @pagerduty if defined?(@pagerduty)
    @pagerduty = Pagerduty.new(Rails.application.secrets.pagerduty_api_key)
  end
end

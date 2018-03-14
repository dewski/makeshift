module Pagerable
  extend ActiveSupport::Concern

  included do
    before_action :verify_user_connected_to_pagerduty
  end

  private def verify_user_connected_to_pagerduty
    return unless Current.user.present?
    return if Current.user.pagerduty_uid?
    redirect_to users_path, notice: "You need to connect your account with your PagerDuty account before continuing."
  end
end

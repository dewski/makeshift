class Pagerduty
  class WrappedUser
    attr_reader :pagerduty_uid, :login, :avatar_url

    def initialize(record)
      @pagerduty_uid = record.fetch("id")
      @login = record.fetch("name")
      @avatar_url = record.fetch("avatar_url")
    end

    def persisted?
      false
    end
  end
end

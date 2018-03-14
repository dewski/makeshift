class Pagerduty
  class WrappedSchedule < WrappedRecord
    attr_reader :pagerduty_id, :name

    def initialize(record)
      @pagerduty_id = record.fetch("id")
      @name = record.fetch("name")
    end

    def to_partial_path
      "schedules/schedule"
    end
  end
end

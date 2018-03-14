class SchedulesController < ApplicationController
  def index
    @schedules = Makeshift.pagerduty.schedules
  end
end

class SchedulesController < ApplicationController
  def index
    @schedules = Makeshift.pagerduty.schedules
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def import
    schedule = Schedule.import(params[:id])
    redirect_to schedule
  end
end

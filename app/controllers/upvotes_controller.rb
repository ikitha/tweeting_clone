class UpvotesController < ApplicationController
  before_action :set_alarm, only: [:create]
  # POST /alarms/:alarm_id/upvotes
  # POST /alarms/:alarm_id/upvotes.json
  def create
    @upvote = Upvote.where(alarm_id: @alarm.id).first
    
    unless @upvote
      @upvote = Upvote.new(alarm_id: @alarm.id)
    end

    respond_to do |format|
      if @upvote.save
        format.html { redirect_to @alarm, notice: 'Alarm was successfully upvoted.' }
        format.json { render :show, status: :created, location: @alarm }
      else
        format.html { render :new }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_alarm
      @alarm = Alarm.find(params[:alarm_id])
    end
end

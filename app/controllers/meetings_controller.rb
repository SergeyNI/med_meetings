class MeetingsController < InheritedResources::Base
  before_action :set_doctor, only: [:new]
  before_action :set_meeting, only: [:edit]

  def new
    @meeting = Meeting.new
  end
  
  def edit
    @doctor= @meeting.doctor
  end
  
  def index
    if params[:status] === '1'
      @meetings = Meeting.where(doctor_recomendations: nil)
    elsif params[:status] === '0'
      @meetings = Meeting.where.not(doctor_recomendations: nil)
    else
      @meetings = Meeting.all
    end
  end

  
  private

    def meeting_params
      params.require(:meeting).permit(:user_id, :doctor_id, :meeting_time, :doctor_recomendations)
    end
    
    def  set_doctor
      @doctor = Doctor.find params[:doctor_id]
    end

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end

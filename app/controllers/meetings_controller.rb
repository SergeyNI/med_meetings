class MeetingsController < InheritedResources::Base
  # before_action :authenticate_user!, only: [:new, :create]
  before_action :set_doctor, only: [:new]
  before_action :set_meeting, only: [:edit,:update]
  # load_and_authorize_resource

  def new
    @meeting = Meeting.new
    # rescue_from CanCan::AccessDenied do |exception|
    #   respond_to {|format| format.html { redirect_to root_path, notice: exception.message } }
    # end
    # rescue CanCan::AccessDenied => exception
    #   respond_to {|format| format.html { redirect_to root_path, notice: exception.message } }
  
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
    @meetings = @meetings.accessible_by(current_ability)
  end
  
  def create
    authorize! :create, @meeting
    @meeting = Meeting.new(meeting_params)
    @meetings_opened = Meeting.where(doctor_recomendations: nil)
    @meeting.user = @current_user
    
    if  @meetings_opened.count <= 3
      respond_to do |format|
        if @meeting.save
          format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        else              
          flash[:errors] = @meeting.errors
          flash[:full_messages] = @meeting.errors.full_messages
          format.html { render :new, status: :unprocessable_entity}
        end
      end
    else 
      respond_to do |format|
        flash[:notice] = "doctor have more then 10 opened meetings"
        format.html { redirect_to action: :new, doctor_id: meeting_params[:doctor_id], meeting: @meeting} 
      end      
    end
    rescue CanCan::AccessDenied
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity}
      end
  end

  
  def update

    authorize! :update, @meeting
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to meetings_path, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
    
    rescue CanCan::AccessDenied
      respond_to do |format|
          format.html { render :edit }
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

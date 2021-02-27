class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[ show edit update destroy ]
  before_action :set_tasks, only: %i[ new edit ]
  before_action :authorization

  # GET /work_sessions or /work_sessions.json
  def index
    @work_sessions = policy_scope(WorkSession)
    @active_session = current_user.running_session
  end

  # GET /work_sessions/1 or /work_sessions/1.json
  def show
  end

  # GET /work_sessions/new
  def new
    @work_session = WorkSession.new
    authorize @work_session
  end

  # GET /work_sessions/1/edit
  def edit
  end

  # POST /work_sessions or /work_sessions.json
  def create
    @work_session = WorkSession.new(work_session_params)
    authorize @work_session

    respond_to do |format|
      if @work_session.save
        format.html { redirect_to @work_session, notice: "Work session was successfully created." }
        format.json { render :show, status: :created, location: @work_session }
      else
        format.html { 
          render :new, status: :unprocessable_entity 
          set_tasks
        }
        format.json { render json: @work_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_sessions/1 or /work_sessions/1.json
  def update
  end

  # DELETE /work_sessions/1 or /work_sessions/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_session
      @work_session = WorkSession.find(params[:id])
      authorize @work_session
    end

    def set_tasks
      @tasks = Task.where(user_id: current_user).where.not(status: 2)
    end

    # Only allow a list of trusted parameters through.
    def work_session_params
      params.require(:work_session).permit(:start, :end, :pause, :keys, :backspace, :last_key, :task_id)
    end

    def authorization
      authorize current_user, policy_class: WorkSessionPolicy
    end
end

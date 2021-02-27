class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[ show edit update destroy ]

  # GET /work_sessions or /work_sessions.json
  def index
    @work_sessions = WorkSession.all
  end

  # GET /work_sessions/1 or /work_sessions/1.json
  def show
  end

  # GET /work_sessions/new
  def new
    @work_session = WorkSession.new
  end

  # GET /work_sessions/1/edit
  def edit
  end

  # POST /work_sessions or /work_sessions.json
  def create
    @work_session = WorkSession.new(work_session_params)

    respond_to do |format|
      if @work_session.save
        format.html { redirect_to @work_session, notice: "Work session was successfully created." }
        format.json { render :show, status: :created, location: @work_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_sessions/1 or /work_sessions/1.json
  def update
    respond_to do |format|
      if @work_session.update(work_session_params)
        format.html { redirect_to @work_session, notice: "Work session was successfully updated." }
        format.json { render :show, status: :ok, location: @work_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_sessions/1 or /work_sessions/1.json
  def destroy
    @work_session.destroy
    respond_to do |format|
      format.html { redirect_to work_sessions_url, notice: "Work session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_session
      @work_session = WorkSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_session_params
      params.require(:work_session).permit(:start, :end, :pause, :keys, :backspace, :last_key, :task_id)
    end
end

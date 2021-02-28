module Api 
  module V1
    class WorkSessionsController < ActionController::API
      def update
        @work_session = WorkSession.find(params[:id])
        @work_session.keys = work_session_params[:keys]
        @work_session.backspace = work_session_params[:backspace]
        @work_session.last_key = work_session_params[:last_key]
        @work_session.end = DateTime.now

        if @work_session.save
          render json: @work_session
        else
          render json: {error: @work_session.errors.full_messages.to_sentence}
        end
      end

      def end_session

      end

      private

      def work_session_params
        params.require(:work_session).permit(:keys, :backspace, :last_key)
      end
    end
  end 
end
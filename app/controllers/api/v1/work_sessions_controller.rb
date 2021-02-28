module Api 
  module V1
    class WorkSessionsController < ActionController::API
      def update
        @work_session = WorkSession.find(params[:id])
        @work_session.keys = (@work_session.keys || 0) + work_session_params[:keys]
        @work_session.backspace = (@work_session.backspace || 0) + work_session_params[:backspace]

        if @work_session.save
          render json: @work_session
        else
          render json: {error: @work_session.errors.full_messages.to_sentence}
        end
      end

      private

      def work_session_params
        params.require(:work_session).permit(:keys, :backspace)
      end
    end
  end
end
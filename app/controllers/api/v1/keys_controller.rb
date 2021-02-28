module Api 
  module V1
    class KeysController < ActionController::API
      def create
        @key = Key.new(key_params)
        render json: @key
      end

      private

      def key_params
        params.require(:key).permit(:test, :test2)
      end
    end
  end
end
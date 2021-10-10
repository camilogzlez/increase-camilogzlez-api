# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApiController
      def index
        @clients = Client.all.order(id: :asc)
        render json: @clients, each_serializer: ClientSerializer, status: :ok
      end

        # def show
        #   @client = Client.find(params[:id])
        #   render json: @client, serializer: TransactionsByClientSerializer, status: :ok
        # end

    end
  end
end

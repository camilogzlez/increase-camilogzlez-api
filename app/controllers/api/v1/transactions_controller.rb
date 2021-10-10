# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApiController
      def index
        @transactions = Transaction.all
        render json: @transactions, each_serializer: TransactionSerializer, status: :ok
      end

      def transactions_by_client
          @client = Client.find(params[:id])
          render json: @client, serializer: TransactionsByClientSerializer, status: :ok

      end

    end
  end
end
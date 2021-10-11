# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApiController
      def index
        @clients = Client.all.order(id: :asc)
        render json: @clients, each_serializer: ClientSerializer, status: :ok
      end

      def client_balance
        @client = Client.find(params[:id])
        @balance = Hash[total_recieved: 0, total_receivable: 0, total_declined: 0]
        client_transactions_sum
        client_discounts_sum
        render json: @balance, status: :ok
      end

      def transactions_by_client
        @client = Client.find(params[:id])
        render json: @client, serializer: TransactionsByClientSerializer, status: :ok
      end

      def client_transactions_sum
        @client.transactions.each do |transaction|
          if transaction.payment.payment_date < Date.today && transaction.status == 'Approved'
            @balance[:total_recieved] += transaction.amount
          elsif transaction.payment.payment_date > Date.today && transaction.status == 'Approved'
            @balance[:total_receivable] += transaction.amount
          else
            @balance[:total_declined] += transaction.amount
          end
        end
      end

      def client_discounts_sum
        @client.discounts.each do |discount|
          if discount.payment.payment_date < Date.today
            @balance[:total_recieved] -= discount.amount
          else
            discount.payment.payment_date > Date.today
            @balance[:total_receivable] -= discount.amount
          end
        end
      end
    end
  end
end

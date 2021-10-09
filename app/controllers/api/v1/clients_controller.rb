# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApiController
      def index
        @clients = Client.all.order(id: :asc)
        render json: @clients, each_serializer: ClientSerializer, status: :ok
      end

      # def show
      # end

      # def update
      #   if @commentary.update(update_params)
      #     render json: @commentary, serializer: CommentarySerializer, status: :ok
      #   else
      #     render json: { error: @commentary.errors }, status: :unprocessable_entity
      #   end
      # end

      # def create
      #   if @commentary.save
      #     render json: @commentary, serializer: CommentarySerializer, status: :created
      #   else
      #     render json: { errors: create_params.errors }, status: :unprocessable_entity
      #   end
      # end

      # def destroy
      #   if @commentary.present?
      #     @commentary.destroy
      #   end

      #   head :no_content
      # end

      # private
      #   def update_params
      #     params.permit(
      #         :body
      #       )
      #   end

      #   def create_params
      #     params.permit(
      #         :body,
      #         :post_id
      #       ).merge(user: current_user)
      #   end
    end
  end
end

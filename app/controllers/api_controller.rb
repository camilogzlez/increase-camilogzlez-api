# frozen_string_literal: true

class ApiController < ApplicationController
  # before_action :authorize_request
  # load_and_authorize_resource

  # attr_accessor :current_user

  def not_found
    render json: { error: 'not_found' }
  end

  # def authorize_request
  #   header = request.headers["Authorization"]
  #   header = header.split(" ").last if header
  #   begin
  #     @decoded = JsonWebToken.decode(header)
  #     @current_user = User.find(@decoded[:user_id])
  # rescue ActiveRecord::RecordNotFound => e
  #   render json: { errors: e.message }, status: :unauthorized
  # rescue JWT::DecodeError => e
  #   render json: { errors: e.message }, status: :unauthorized
  #   end
  #   end
end

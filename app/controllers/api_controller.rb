# frozen_string_literal: true

class ApiController < ApplicationController
  def not_found
    render json: { error: 'not_found' }
  end
end

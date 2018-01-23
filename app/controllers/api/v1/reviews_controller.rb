class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.all
  end
end

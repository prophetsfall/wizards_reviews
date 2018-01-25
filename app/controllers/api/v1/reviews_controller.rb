class Api::V1::ReviewsController < ApplicationController
  
  def create
    new_review = Review.new(review_params)
    if user_signed_in?
      new_review.wizard_id = params[:review][:wizard_id]
      new_review.user_id = params[:review][:user_id]
      if new_review.save
        render json: { review: review_params }
      else
        render json: { review: review_params, errors: new_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { review: review_params, errors: "Access Denied" }, status: 401
    end
  end

  def update
    updated_review = Review.find(params[:review][:id])
    if user_signed_in? && current_user.id == params[:review][:user_id].to_i
      if updated_review.update(review_params)
        render json: { review: review_params }
      else
        render json: { errors: updated_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied" }, status: 401
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end

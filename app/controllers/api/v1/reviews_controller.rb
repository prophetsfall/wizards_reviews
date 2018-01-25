class Api::V1::ReviewsController < ApplicationController
  def create
    wizard = Wizard.find(review_params[:wizard_id])
    if user_signed_in?
      new_review = Review.new(review_params.merge({user_id: current_user.id}))
      if new_review.save
        render json: { review: review_params }
      else
        render json: { review: review_params, errors: new_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied" }, status: :forbidden
    end
  end

  def update

    review = Review.find(review_params[:id])
    if current_user.id == review.user_id
      if review.update(review_params)
        render json: { review: review_params }
      else

        render json: { review: review_params, errors: new_review.errors.full_messages }, status: :unprocessable_entity
      end
    else

      render json: { review: review_params, errors: "Access Denied" }, status: :unprocessable_entity
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :wizard_id, :rating, :id)
  end
end

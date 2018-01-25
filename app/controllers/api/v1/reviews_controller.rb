class Api::V1::ReviewsController < ApplicationController
  def create
    new_review = Review.new(review_params)
    wizard = Wizard.find(review_params[:wizard_id])
    if user_signed_in?
      # Design descision to be made: will the react element need the wizard?
      if new_review.save
        render json: { wizard: wizard, review: review_params }
      else
        render json: { wizard: wizard, review: review_params, errors: new_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { wizard: wizard, review: review_params, errors: "Access Denied" }, status: :unprocessable_entity
    end
  end

  def update

    review = Review.find(review_params[:id])
    if current_user.id == review_params[:user_id].to_i

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
    params.require(:review).permit(:body, :wizard_id, :user_id, :rating, :id)
  end
end

class Api::V1::ReviewsController < ApplicationController
  def create
    wizard = Wizard.find(review_params[:wizard_id])
    if user_signed_in?
      new_review = Review.new(review_params)
      new_review.user = current_user
      if new_review.save
        render json: { review: new_review }
      else
        render json: { review: new_review, errors: new_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied" }, status: 401
    end
  end

  def update
    updated_review = Review.find(params[:review][:id])
    if user_signed_in? && current_user.id == params[:review][:user_id].to_i
      if updated_review.update(review_params)
        render json: { review: updated_review }
      else
        render json: { errors: updated_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied" }, status: 401
    end
  end

  def destroy
    destroyed_review = Review.find(params[:review][:id])
    if user_signed_in? && (current_user.id == destroyed_review.user_id || current_user.role == 'admin')
      if destroyed_review.destroy
        redirect_to wizard_path(review_params[:wizard_id])
      else
        render json: { errors: destroyed_review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied, Punk"}, status: 401
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating, :wizard_id)
  end
end

class Api::V1::ReviewsController < ApplicationController

  def create
    wizard = Wizard.find(review_params[:wizard_id])
    review = params[:review][:review_id]

    if user_signed_in?
      update_review = Review.where(user_id: current_user.id, id: review, wizard_id: wizard)
      if !update_review.empty?
        Review.destroy(review)
        new_review = Review.new(review_params)
        new_review.user = current_user
        if new_review.save
          render json: { review: new_review }
        else
          render json: { review: new_review, errors: new_review.errors.full_messages }, status: :unprocessable_entity
        end
      else
        new_review = Review.new(review_params)
        new_review.user = current_user
        if new_review.save
          render json: { review: new_review }
        else
          render json: { review: new_review, errors: new_review.errors.full_messages }, status: :unprocessable_entity
        end
      end
    else
      render json: { errors: "Access Denied" }, status: 401
    end
  end


  def destroy
    destroyed_review = Review.find(params[:review][:review_id])
    if user_signed_in? && (current_user.id == destroyed_review.user_id || current_user.role == 'admin')
      if destroyed_review.destroy
        render json: {message:"Review Deleted"}
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

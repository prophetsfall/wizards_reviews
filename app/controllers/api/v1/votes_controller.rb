class Api::V1::VotesController < ApplicationController
  def create
    review = params[:vote][:review_id]
    value = params[:vote][:vote]
    if user_signed_in?
      update_vote = Vote.where(user_id: current_user.id, review_id: review)
      if !update_vote.empty?
        if update_vote[0].vote == value
          update_vote.update(vote: 0)
          render json: Review.find(review)
        else
          update_vote.update(vote: value)
          render json: Review.find(review)
        end
      else
        new_vote = Vote.new(user_id: current_user.id, review_id: review, vote: value)
        if new_vote.save
          render json: Review.find(review)
        else
          render json: { errors: new_vote.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end

class ReviewsController < ApplicationController

  def destroy
    @review = Review.find(params[:id])
    @wizard = @review.wizard
    if (current_user.id == @review.user_id) || current_user.role == 'admin'
      if @review.destroy
        redirect_to wizard_path(@wizard)
        flash[:notice] = "Review deleted successfully"
      else
        flash[:notice] = 'Review deletion failed'
        redirect_to wizards_path(@review.wizard)
      end
    else
      flash[:notice] = "You must be signed in!"
      redirect_to new_user_session_path
    end
  end
end

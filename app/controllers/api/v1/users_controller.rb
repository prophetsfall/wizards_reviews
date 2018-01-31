class Api::V1::UsersController < ApplicationController

  def index
    if current_user.admin?
      render json: {users: User.all, wizards: Wizard.all, reviews: Review.all}
    else
      render json: {error: "Not authorized to use API"}, status: :unprocessable_entity
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :user_name )
  end
end

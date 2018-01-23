class Api::V1::UsersController < ApplicationController

  def index
    if current_user.admin?
      render json: {users: User.all}
    else
      render json: {error: "Not authorized to use API"}, status: :unprocessable_entity
    end
  end

  protected
  
  def user_params
    params.require(:user).permit(:email )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end

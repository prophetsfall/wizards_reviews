class Api::V1::UsersController < ApplicationController

  def index
    if current_user.admin?
    render json: {users: User.all}
  else
    render json: {error: "Not authorized to use API"}, status: :unprocessable_entity
    end
  end

  # def show
  #   @user = User.find(params[:id])
  #   render json: {user: @user}
  # end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     redirect_to users_path
  #     flash[:notice] = "User ceated successfully"
  #   else
  #     flash[:notice] = "User add failed"
  #     render :new
  #   end
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #   if !current_user.id == @user.id
  #     raise ActionController::RoutingError.new("Cannot edit another user")
  #   else
  #   redirect_to users_path
  #   end
  #
  # end

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

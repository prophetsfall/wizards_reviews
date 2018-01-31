class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @wizards = Wizard.all
      @users = User.all
      @reviews = Review.all
    else
      render json: {error: "Not authorized to use API"}, status: :unprocessable_entity
    end
  end

  def destroy
    @user= User.find(params[:id])
    if current_user.admin?
      if @user.destroy
        redirect_to wizards_path
        flash[:notice] = "Wizard and reviews deleted successfully"
      else
        flash[:notice] = 'Wizard deletion failed'
        render :edit
      end
    else
      flash[:notice] = "You must be signed in!"
      redirect_to new_user_session_path
    end
  end


end

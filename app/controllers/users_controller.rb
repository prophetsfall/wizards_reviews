class UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to wizards_path
    end
  end

end

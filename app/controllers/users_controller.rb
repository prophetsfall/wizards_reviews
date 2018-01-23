class UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to wizards_path
    end


    def authorize_user
      if !user_signed_in? || !current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end


  end

end

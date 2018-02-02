class WizardsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index; end

  def show
    render :index
  end

  def new
    @magic_schools = MagicSchool.all
    if current_user
      @wizard = Wizard.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if current_user
      @wizard = Wizard.new(wizard_params)
      @wizard.creator_id = current_user.id

      if @wizard.save
        redirect_to wizard_path(@wizard.id)
        flash[:notice] = 'Wizard added successfully'
      else
        flash[:notice] = 'Wizard add failed'
        render :new
      end
    else
      flash[:notice] = "You must be signed in!"
      redirect_to new_user_session_path
    end
  end

  def edit
    @wizard = Wizard.find(params[:id])
    if current_user
      @wizard = Wizard.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @wizard = Wizard.find(params[:id])
    if (current_user.id == @wizard.creator_id) || current_user.role == 'admin'
      if @wizard.update(wizard_params)
        redirect_to wizard_path(@wizard.id)
        flash[:notice] = 'Wizard updated successfully'
      else
        flash[:notice] = 'Wizard update failed'
        render :edit
      end
    else
      flash[:notice] = "You must be signed in!"
      redirect_to new_user_session_path
    end
  end

  def destroy
    @wizard = Wizard.find(params[:id])
    if (current_user.id == @wizard.creator_id) || current_user.role == 'admin'
      if @wizard.destroy
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
  protected

  def wizard_params
    params.require(:wizard).permit(:name, :description, :img_url, :magic_school_id, :origin)
  end
end

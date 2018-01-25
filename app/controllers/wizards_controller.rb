class WizardsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index; end

  def show
    render :index
  end

  def new
    if current_user
      @wizard = Wizard.new
    else
      redirect_to :index
    end
  end

  def create
    if current_user
      @wizard = Wizard.new(wizards_params.merge({ creator_id: current_user.id }))
      if @wizard.save
        flash[:notice] = 'Wizards added successfully'
        redirect_to wizard_path(@wizard)
      else
        flash[:notice] = 'Wizards add failed'
        render :new
      end
    else
      flash[:notice] = "You must be signed in!"
      render :new
    end
  end

  protected

  def wizards_params
    params.require(:wizard).permit(:name, :description, :img_url)
  end
end

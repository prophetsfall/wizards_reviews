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
    @wizard = Wizard.new(wizards_params)
    if current_user
      if @wizard.save
        # redirect_to wizard_path(@wizard)
        # binding.pry
        redirect_to wizard_path(@wizard)
        flash[:notice] = 'Wizards added successfully'
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
    params.require(:wizard).permit(:name, :description, :img_url, :creator_id)
  end
end

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
      render :new
    end
  end

  def edit
    @wizard = Wizard.find(params[:id])
    render :edit
  end

  def update
    @wizard = Wizard.find(params[:wizard][:id])
    if current_user.id == @wizard.creator_id
      if @wizard.update(wizard_params)
        redirect_to @wizard
      else
        render :edit
      end
    else
      flash[:error] = "You can't do that on wizard television"
      redirect_to @wizard
    end
  end

  protected

  def wizard_params
    params.require(:wizard).permit(:name, :description, :img_url, :id, :creator_id)
  end
end

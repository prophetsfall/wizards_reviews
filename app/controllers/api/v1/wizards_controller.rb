class Api::V1::WizardsController < ApplicationController
  def index
    render json: Wizard.all
  end

  def show
    @wizard = Wizard.find_by(name: params[:id])
    render json: { wizard: @wizard, reviews: @wizard.reviews }
  end

  protected

  def wizard_params
    params.require(:wizard).permit(:id, :name, :description, :img_url, :creator_id)
  end
end

class Api::V1::WizardsController < ApplicationController
  def index
    render json: Wizard.all
  end

  def show
    @wizard = Wizard.find(params[:id])
    render json: { wizard: @wizard, reviews: @wizard.reviews }
  end
end

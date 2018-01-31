class Api::V1::WizardsController < ApplicationController

  def index
    render json: Wizard.all
  end

  def show
    @user = current_user
    @wizard = Wizard.find(params[:id])
    render json: @wizard, serializer: WizardShowSerializer
  end
end

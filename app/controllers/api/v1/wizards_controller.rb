class Api::V1::WizardsController < ApplicationController

  def index
    all_wizards = Wizard.all
     render json: all_wizards, each_serializer: WizardShowSerializer
  end

  def show
    @user = current_user
    @wizard = Wizard.find(params[:id])
    render json: @wizard, serializer: WizardShowSerializer
  end
end

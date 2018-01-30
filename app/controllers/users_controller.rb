class UsersController < ApplicationController
  def index
    render json: Wizard.all
  end

  def show
    @wizard = Wizard.find(params[:id])
    render json: Wizard.find(params[:id]), serializer: WizardShowSerializer
  end
end
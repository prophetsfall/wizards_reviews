class Api::V1::WizardsController < ApplicationController
  def index
    render json: Wizard.all
  end

  def show
    @wizard = Wizard.find_by(name: params[:id])
    render json: { wizard: @wizard, reviews: @wizard.reviews }
  end

  def update
    updated_wizard = Wizard.find(params[:id])
    if current_user.admin?
      if updated_wizard.update(wizard_params)
        render json: { wizard: wizard_params }
      else
        render json: { errors: updated_wizard.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Access Denied" }, status: 401
    end
  end

  protected

  def wizard_params
    params.require(:wizard).permit(:id, :name, :description, :img_url, :creator_id)
  end
end

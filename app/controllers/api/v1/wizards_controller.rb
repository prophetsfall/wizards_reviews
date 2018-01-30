class Api::V1::WizardsController < ApplicationController

  def index
    render json: Wizard.all
  end

  def show
      @user = current_user
      @wizard = Wizard.find(params[:id])
      render json: { user: @user, wizard: @wizard, reviews: @wizard.reviews }
  end

  protected

  def wizard_params
      params.require(:wizard).permit(
        :name,
        :user_id,
        :id,
        :description,
        :imgUrl,
        :rating,
        :reviews,
        :creator_id
      )

  end
end

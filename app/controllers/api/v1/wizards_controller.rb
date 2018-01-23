class Api::V1::WizardsController < ApplicationController
  def index
    render json: Wizard.all 
  end
end

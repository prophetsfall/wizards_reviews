class Api::V1::WizardsController < ApplicationController
  def index
    render json: Wizard.all # this needs to be returning our wizard reviews as well
  end
end

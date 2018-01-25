class WizardsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :new, :create]

  def index; end
  def new
    @wizard = Wizard.new
  end
end

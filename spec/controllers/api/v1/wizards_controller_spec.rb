require 'rails_helper'

RSpec.describe Api::V1::WizardsController, type: :controller do
  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    created_by: 2
    )}

  describe "GET#index" do
    it "should return our wizards" do
      get :index
      returned_json = JSON.parse(response.body)
      binding.pry

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
    end
  end
end

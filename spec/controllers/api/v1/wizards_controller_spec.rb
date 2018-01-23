require 'rails_helper'

RSpec.describe Api::V1::WizardsController, type: :controller do
  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: 2
    )}
  let!(:install) { Wizard.create(
    name: "Microsoft",
    description: "Installation Wizard",
    img_url: "www.microsoft.com",
    creator_id: 2
  )}

  describe "GET#index" do
    it "should return our wizards" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["name"]).to eq "Clippy"
      expect(returned_json[0]["description"]).to eq "Unacceptably helpful word wizard"
      expect(returned_json[1]["name"]).to eq "Microsoft"
    end
  end
end

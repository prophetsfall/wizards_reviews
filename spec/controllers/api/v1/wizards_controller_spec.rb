require 'rails_helper'

RSpec.describe Api::V1::WizardsController, type: :controller do
  let!(:user1) {FactoryBot.create(:user)}
  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user1.id
    )
  }

  let!(:clippy_review) { Review.create(
    user_id: user1.id,
    wizard_id: clippy.id,
    body: "Clippy is not ideal.",
    rating: 20
    )}

  let!(:install) { Wizard.create(
    name: "Microsoft",
    description: "Installation Wizard",
    img_url: "www.microsoft.com",
    creator_id: user1.id
    )}

    describe "GET#index" do
      it "should return our wizards" do
          sign_in :user, user1
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

    describe "GET#show" do
      it "should return our review" do
        sign_in :user, user1
        get :show, params:{ id: clippy.id }
        returned_json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json")
        expect(returned_json)
      end
    end
  end

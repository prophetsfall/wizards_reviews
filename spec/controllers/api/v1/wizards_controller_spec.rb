require 'rails_helper'

RSpec.describe Api::V1::WizardsController, type: :controller do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}

  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user1.id
    )
  }
  let!(:clippy1) { Wizard.new(
    name: "Clippy1",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user2.id
    )
  }

  let!(:clippy_review) { Review.create(
    user_id: user1.id,
    wizard_id: clippy.id,
    body: "Clippy is not ideal.",
    rating: 20
    )
  }

  let!(:install) { Wizard.create(
    name: "Microsoft",
    description: "Installation Wizard",
    img_url: "www.microsoft.com",
    creator_id: user1.id
    )
  }

  describe "GET#index" do
    it "should return our wizards" do
      sign_in :user, user1
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["wizards"].length).to eq 2
      expect(returned_json["wizards"][0]["name"]).to eq "Clippy"
      expect(returned_json["wizards"][0]["description"]).to eq "Unacceptably helpful word wizard"
      expect(returned_json["wizards"][1]["name"]).to eq "Microsoft"
    end
  end

  describe "GET#show" do
    it "should return our review" do
      sign_in :user, user1
      get :show, params:{ id: clippy.id }
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["wizard"]["name"]).to eq "Clippy"
      expect(returned_json["reviews"][0]["body"]).to eq "Clippy is not ideal."
    end
  end

  describe "POST#create" do
    it "should return a json object of the new wizard" do
      sign_in :user, user1
      post :create, params: { wizard: { name: clippy1.name, description: clippy1.description, img_url: clippy1.img_url, creator_id: clippy1.creator_id } }
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["wizard"]["name"]).to eq "Clippy1"
      expect(returned_json["reviews"]).to eq []
    end
    it 'should return a 422 if a non-admin attempts to post' do
      sign_in :user, user2

      post :create, params: { wizard: { name: clippy1.name, description: clippy1.description, img_url: clippy1.img_url, creator_id: clippy1.creator_id } }

      expect(response.status).to eq 422

    end
  end

  describe "PATCH#update" do
    it "should return a json object of the updated wizard" do
      sign_in :user, user1
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "Really he's not that bad once you get to know him", img_url: "www.clippy.com", creator_id: user1.id } }

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      returned_json = JSON.parse(response.body)

      expect(returned_json["wizard"]["description"]).to eq "Really he's not that bad once you get to know him"
    end

    it "should return a status of 422 if form is not editted correctly" do
      sign_in :user, user1
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "", img_url: "www.clippy.com", creator_id: user1.id } }

      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")
      returned_json = JSON.parse(response.body)
      expect(returned_json["errors"][0]).to eq "Description can't be blank"
    end

    it "should return a status of 401 if user is not an admin" do
      sign_in :user, user2
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "Really he's not that bad once you get to know him", img_url: "www.clippy.com", creator_id: user1.id } }

      expect(response.status).to eq 401
      expect(response.content_type).to eq("application/json")
      returned_json = JSON.parse(response.body)
      expect(returned_json["errors"]).to eq "Access Denied"
    end
  end
end

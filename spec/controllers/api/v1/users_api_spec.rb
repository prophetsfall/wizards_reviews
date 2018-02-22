require 'rails_helper'


RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET#index" do
    it "should return a list of all the users" do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:user, role: "admin")
      sign_in :user, admin # sign_in(scope, resource)
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)

      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json["users"].length).to eq 3
    end

    it "should not return a list of all the users to non-admin" do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:user, role: "admin")

      user1 = FactoryBot.create(:user, role: "member")
      user2 = FactoryBot.create(:user)
      sign_in :user, user1 # sign_in(scope, resource)

      get :index
      expect(response.status).to eq 422
    end
  end

end

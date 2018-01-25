require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}

  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user1.id
    )
  }
  describe 'POST#create' do

    it 'should return a json object of the review with a 200 response if succesful'   do
      sign_in :user, user2

      post :create, params: { review: { user_id: user2.id, wizard_id: clippy.id, body: "Clippy is not ideal.", rating: 20 } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["review"]["body"]).to eq "Clippy is not ideal."
    end

    it 'should return a json object with errors and a 422 response if a field is empty' do
      sign_in :user, user2

      post :create, params: { review: { user_id: user2.id, wizard_id: clippy.id, body: '', rating: '' } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")

      expect(returned_json["errors"][0]).to eq "Body can't be blank"
      expect(returned_json["errors"][1]).to eq "Rating can't be blank"
    end

    it 'should return a json object with errors and a 401 response if user is not logged in' do
      post :create, params: { review: { user_id: user2.id, wizard_id: clippy.id, body: "Clippy is not ideal.", rating: 20 } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 401
      expect(response.content_type).to eq("application/json")
      expect(returned_json["errors"]).to eq "Access Denied"

    end
  end

  describe 'PATCH#update' do

    it 'should return a json object with our updated review' do
      sign_in :user, user2
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      patch :update, params: { id: review1.id, review: { id: review1.id, user_id: user2.id, wizard_id: clippy.id, body: "cow", rating: 20 } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["review"]["body"]).to eq "cow"
      expect(returned_json["review"]["rating"]).to eq 20
    end

    it 'should return a status of 422 if form is filled out incorrectly' do
      sign_in :user, user2
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      patch :update, params: { id: review1.id, review: { id: review1.id, user_id: user2.id, wizard_id: clippy.id, body: "", rating: 20 } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")

      expect(returned_json["errors"][0]).to eq "Body can't be blank"
    end

    it 'should return 401 if the correct user is not logged in' do
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      patch :update, params: { id: review1.id, review: { id: review1.id, user_id: user2.id, wizard_id: clippy.id, body: "cow", rating: 20 } }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 401
      expect(response.content_type).to eq("application/json")
      expect(returned_json["errors"]).to eq "Access Denied"
    end

  end
end

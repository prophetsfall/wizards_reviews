require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:user3) {FactoryBot.create(:user, role: "member")}

  let!(:school) {MagicSchool.create(name: 'evocation')}

  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user1.id,
    magic_school: school
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

  describe "DELETE#destroy" do
    it 'removes a review from the database if the creator deletes it' do
      sign_in :user, user2
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      delete :destroy, params: { id: review1.id, review: {review_id:review1.id ,user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40} }

      expect{Review.find(review1.id)}.to raise_error
    end

    it 'removes a review from the database if an admin deletes it' do
      sign_in :user, user1
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      delete :destroy, params: { id: review1.id, review: { review_id: review1.id, user_id: user2.id, wizard_id: clippy.id, body: "cow", rating: 20 } }

      expect{Review.find(review1.id)}.to raise_error
    end

    it 'does not remove a review if another user deletes it' do
      sign_in :user, user3
      review1 = Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )

      delete :destroy, params: { id: review1.id, review: { review_id: review1.id, user_id: user2.id, wizard_id: clippy.id, body: "cow", rating: 20 } }

      expect{Review.find(review1.id)}.to_not raise_error

    end
  end
end

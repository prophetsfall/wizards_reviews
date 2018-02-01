require 'rails_helper'

RSpec.describe Api::V1::VotesController, type: :controller do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:school) {MagicSchool.create(name: 'evocation')}
  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user1.id,
    magic_school: school,
    origin: "Microsoft"
    )
  }
  let!(:review) {Review.create(user: user1, wizard: clippy, body: "Clippy is not ideal", rating: 20)}
  let!(:vote) {Vote.create(user_id: user1.id, review_id: review.id, vote: 1)}
  describe "create vote" do
    it "should increase a review's vote count" do
      sign_in :user, user2
      post :create, params: { vote: {review_id: review.id, vote: 1}}
      expect(review.vote_count).to eq 2
    end

    it "should decrease a review's vote count" do
      sign_in :user, user2
      post :create, params: { vote: {review_id: review.id, vote: -1}}
      expect(review.vote_count).to eq 0
    end

    it "should not increase a review's vote count twice" do
      sign_in :user, user1
      post :create, params: { vote: {review_id: review.id, vote: 1}}
      expect(review.vote_count).to eq 1
    end

    it "rejects illegal votes" do
      sign_in :user, user2
      post :create, params: { vote: {review_id: review.id, vote: 30}}
      expect(response.status).to eq 422
      expect(review.vote_count).to eq 1
    end
  end
  describe "change vote" do
    it "should change an up to a down" do
      sign_in :user, user1
      post :create, params: { vote: {review_id: review.id, vote: -1}}
      expect(review.vote_count).to eq -1
    end

    it "changes an up vote to a non-vote" do
      sign_in :user, user1
      post :create, params: { vote: {review_id: review.id, vote: 0}}
      expect(review.vote_count).to eq 0
    end
  end
end

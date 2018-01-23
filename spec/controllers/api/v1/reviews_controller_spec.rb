require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:clippy) { Wizard.create(
                  name: "Clippy",
                  description: "Unacceptably helpful word wizard",
                  img_url: "www.clippy.com",
                  creator_id: 2
                  )}
  user = FactoryBot.create(:user)
  let!(:clippy_review) { Review.create(
                         user_id: user.id,
                         wizard_id: clippy.id,
                         body: "Clippy is not ideal.",
                         rating: 20
                         )}

    describe "GET#index" do
      it "should return our review" do
        get :index
        returned_json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json")
        expect(returned_json)
      end
    end
end

require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    let!(:user) {FactoryBot.create(:user, role: "member")}
    let!(:school) {MagicSchool.create(name: "Dark Magic")}
    let!(:clippy) { Wizard.create(
      name: "Clippy",
      description: "Unacceptably helpful word wizard",
      img_url: "www.clippy.com",
      creator_id: user.id,
      magic_school: school,
      origin: "Microsoft"
      )
    }
    let!(:review) {Review.create!(user_id: user.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )}
    it {should have_valid(:vote).when(-1)}
    it {should have_valid(:vote).when(0)}
    it {should have_valid(:vote).when(1)}
    it 'should fail when user has already voted' do
    Vote.create!(user_id: user.id, review_id: review.id, vote: 1)
      test_review = Vote.new(user_id: user.id, review_id: review.id, vote: 1)
      !test_review.valid?
    end
  end
end

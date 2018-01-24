require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#admin?" do
    it "is not an admin if the role is not admin" do
      user = FactoryBot.create(:user, role: "member")
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = FactoryBot.create(:user, role: "admin")
      expect(user.admin?).to eq(true)
    end
  end
  describe 'validations' do
    it { should have_valid(:user_name).when('NewUserName') }

    it { should_not have_valid(:user_name).when("") }

    it 'should fail for duplicate user name' do
      user = FactoryBot.create(:user, role: "admin")
      should_not have_valid(:user_name).when(user.user_name)
    end
  end
end

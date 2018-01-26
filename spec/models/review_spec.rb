require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should have_valid(:body).when('A body') }
    it { should have_valid(:rating).when(100) }


    it { should_not have_valid(:body).when("") }
    it { should_not have_valid(:rating).when("") }
  end
end
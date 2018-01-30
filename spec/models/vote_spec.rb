require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
  
    review = Review.new()
    it {should have_valid(:vote).when(-1)}
    it {should have_valid(:vote).when(0)}
    it {should have_valid(:vote).when(1)}
    it {should_not have_valid(:vote).when(2)}


  end
end
require 'rails_helper'


RSpec.describe Api::V1::UsersController, type: :controller do

  # before(:each) do
    # @request.env["devise.mapping"] = Devise.mappings[:admin]
    # admin = FactoryBot.create(:user, role: "admin")
    # sign_in :user, admin # sign_in(scope, resource)
    # user1 = FactoryBot.create(:user)
    # user2 = FactoryBot.create(:user)
  # end

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
  end
  describe "GET#index" do
    it "should not return a list of all the users to non-admin" do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:user, role: "admin")

      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      sign_in :user, user1 # sign_in(scope, resource)

      get :index
      expect(response.status).to eq 422
    end
  end


end





#
# feature 'admin get api', %Q{
#   As a signed in admin
#   I want to visit the api and see the JSON of users
#   If I am not an admin I should get an error.
# } do
#   scenario 'specify valid credentials' do
#     user1 = FactoryBot.create(:user)
#     user2 = FactoryBot.create(:user, role: "admin")
#     visit '/'
#
#
#     click_link 'Sign In'
#     fill_in 'Email', with: user2.email
#     fill_in 'Password', with:user2.password
#     click_button 'Log in'
#     expect(page).to have_content('Signed in successfully')
#     visit '/api/v1/users'
#     expect(page).to have_content('users')
#     expect(page).to have_content(user2.email)
#   end
#   scenario 'specify valid credentials' do
#     user3 = FactoryBot.create(:user)
#     user4 = FactoryBot.create(:user, role: "admin")
#     visit '/'
#
#
#     click_link 'Sign In'
#     fill_in 'Email', with: user3.email
#     fill_in 'Password', with:user3.password
#     click_button 'Log in'
#     expect(page).to have_content('Signed in successfully')
#     visit '/api/v1/users'
#     expect(page).to have_content('Not authorized to use API')
#   end
#
# end

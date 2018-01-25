require 'rails_helper'

describe 'New wizard Form' do
  let!(:user2) {FactoryBot.create(:user, role: "member")}

  scenario 'signed in user submits a valid form' do
    visit '/'

    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log in'

    visit 'wizards/new'

    fill_in 'Name', with: 'Mr McGee'
    fill_in 'Description', with: "He's a good wizard"
    click_button "Add wizard"
  end
  scenario 'user submits invalid form' do

  end
  scenario 'guest attempts to access form' do

  end
end
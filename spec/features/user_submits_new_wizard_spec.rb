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
    click_button "Add Wizard"
    expect(page).to have_content 'Wizard added successfully'
  end
  scenario 'user submits invalid form' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    visit 'wizards/new'
    click_button "Add Wizard"
    expect(page).to have_content 'Wizard add failed'
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_content 'Description can\'t be blank'
  end
  scenario 'guest attempts to access form' do
    visit '/wizards/new'
    expect(page).to have_content "You need to sign in or sign up before continuing."
    page.should have_xpath('/')
  end
end

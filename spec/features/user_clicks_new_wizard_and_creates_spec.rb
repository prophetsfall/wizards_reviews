require 'rails_helper'

feature 'user clicks new wizard and creates new wizard', %Q{
  As a signed in user
  I want to click new wizard
  So that I can create a new wizard
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content("Signed in successfully")

    click_link 'New Wizard'
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("New Wizard Form")
  end

  scenario 'creates a wizard' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'New Wizard'
    fill_in 'Name', with: "Mortimar"
    fill_in 'Description', with: "Mage Most Magnificint"

    click_button 'Add Wizard'
    expect(page).to have_content("Wizard added successfully")
  end
end

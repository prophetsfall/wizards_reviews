require 'rails_helper'

describe 'Edit wizard Form' do
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:school) {MagicSchool.create(name: 'Necromancy')}

  let!(:wizardguy) {FactoryBot.create(:wizard, creator_id: user2.id, magic_school: school)}

  scenario 'signed in user submits a valid form' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    visit "/wizards/#{wizardguy.id}/edit"
    expect(page).to have_content wizardguy.name
    fill_in 'Name', with: 'Mr McGee'
    fill_in 'Description', with: "He's a good wizard"
    click_button "Submit"
    expect(page).to have_content 'Wizard updated successfully'
  end
  scenario 'signed in user submits an invalid form' do

    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    visit edit_wizard_path(wizardguy.id)
    expect(page).to have_content wizardguy.name
    fill_in 'Name', with: 'Mr McGee'
    fill_in 'Description', with: ""
    click_button "Submit"
    expect(page).to have_content 'Wizard update failed'
  end
end

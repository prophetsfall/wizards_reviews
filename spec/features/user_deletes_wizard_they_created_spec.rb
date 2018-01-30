require 'rails_helper'

describe 'Wizard delete function' do
  let!(:user1) {FactoryBot.create(:user, role: "member")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:wizardguy) {FactoryBot.create(:wizard, creator_id: user2.id)}
  let!(:wizardguy2) {FactoryBot.create(:wizard, creator_id: user1.id)}

  scenario 'signed in user deletes a wizard they created' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    visit "/wizards/#{wizardguy.id}/edit"
    expect(page).to have_content wizardguy.name
    click_link 'delete'
    expect(page).to have_content 'Wizard and reviews deleted successfully'
  end

end

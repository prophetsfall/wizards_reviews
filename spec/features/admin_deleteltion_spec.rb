require 'rails_helper'

describe 'Admin user views a list of users, wizards, and reviews. Can delete any of these' do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:school) {MagicSchool.create(name: 'Necromancy')}
  let!(:wizardguy1) {FactoryBot.create(:wizard, creator_id: user2.id, magic_school: school)}
  let!(:review1) {FactoryBot.create(:review, wizard: wizardguy1, user: user1)}
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:wizardguy2) {FactoryBot.create(:wizard, creator_id: user2.id, magic_school: school)}
  let!(:review2) {FactoryBot.create(:review, wizard: wizardguy2, user: user2)}
  let!(:user3) {FactoryBot.create(:user, role: "member")}
  let!(:wizardguy3) {FactoryBot.create(:wizard, creator_id: user2.id, magic_school: school)}
  let!(:review3) {FactoryBot.create(:review, wizard: wizardguy3, user: user3)}

  scenario 'signed in admin views index' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'
    visit "/users"
    expect(page).to have_content wizardguy1.name
    expect(page).to have_content user2.user_name
  end

  scenario 'signed in admin deletes user' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'
    visit "/users"
    expect(page).to have_content wizardguy1.name
    expect(page).to have_content user2.user_name
    click_link "Delete #{user2.user_name}"
    expect(page).to have_content "User deleted successfully"
  end

  scenario 'signed in admin deletes wizard' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'
    visit "/users"
    expect(page).to have_content wizardguy1.name
    expect(page).to have_content user2.user_name
    click_link "Delete #{wizardguy3.name}"
    expect(page).to have_content "Wizard and reviews deleted successfully"
  end

  scenario 'signed in admin deletes reviews' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'
    visit "/users"
    expect(page).to have_content wizardguy1.name
    expect(page).to have_content user2.user_name
    expect(page).to have_content review2.body
    click_link "Delete Review #{review2.id}"
    expect(page).to have_content "Review deleted successfully"
  end

end

require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: "JANKYMAN"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password confirmation", with: "boomstick!3vilisd3ad"
    attach_file "Upload profile photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    # expect(page).to have_css("img[src*='photo.png']")
  end
end
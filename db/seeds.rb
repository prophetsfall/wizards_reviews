# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user#{n}"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'member'
  end
end

gandalfa = Wizard.find_or_create_by!(name: "Gandalf the White", description: "Hes got to be top ten maybe 5")
gandalfb = Wizard.find_or_create_by!(name: "Gandalf the Grey", description: "Hes great and all but he hidding")
qwdion = Wizard.find_or_create_by!(name: "Gwydion", description: "Hes norse")
merlin = Wizard.find_or_create_by!(name: "Merlin", description: "Super famouse wizard")
jafar = Wizard.find_or_create_by!(name: "Jafar", description: "Hes from aladdin")
maurgris = Wizard.find_or_create_by!(name: "Maugris", description: "Hes enchants matter in france")
saruman = Wizard.find_or_create_by!(name: "Saruman", description: "Hes fights Gandalf")

bob = FactoryBot.create(:user)
steve = FactoryBot.create(:user)
jill = FactoryBot.create(:user)


Review.find_or_create_by!(user: bob, wizard: gandalfa, body: "top ten all time for sure", rating: 100)
Review.find_or_create_by!(user: steve, wizard: gandalfa, body: "tnah he not so strong ", rating: 25)
Review.find_or_create_by!(user: bob, wizard: gandalfb, body: "still not sure how he could survie that fall, unrealtic would not recomennd", rating: 75)
Review.find_or_create_by!(user: jill, wizard: gandalfb, body: "He dies in the fall...", rating: 100)

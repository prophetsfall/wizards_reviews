# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Wizard.find_or_create_by!(name: "Gandalf the White", description: "Hes got to be top ten maybe 5")
Wizard.find_or_create_by!(name: "Gandalf the Grey", description: "Hes great and all but he hidding")
Wizard.find_or_create_by!(name: "Gwydion", description: "Hes norse")
Wizard.find_or_create_by!(name: "Merlin", description: "Super famouse wizard")
Wizard.find_or_create_by!(name: "Jafar", description: "Hes from aladdin")
Wizard.find_or_create_by!(name: "Maugris", description: "Hes enchants matter in france")
Wizard.find_or_create_by!(name: "Saruman", description: "Hes fights Gandalf")

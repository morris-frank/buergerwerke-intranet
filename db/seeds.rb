# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Cooperative.create!(email: 'info@heg.de', address: 'Eppelheim', name: 'Heidelberger Energiegenossenschaft', website: 'https://hd-eeg.de') if Rails.env.development?
Cooperative.create!(email: 'info@eeg.de', address: 'Entenhausen', name: 'Entenhausener Energiegenossenschaft', website: 'https://entenhausen.com') if Rails.env.development?

Group.create!(name: 'Hanseatische Genossen', visible: false) if Rails.env.development?
Group.create!(name: 'Badische Solarfachgruppe', visible: true) if Rails.env.development?

Member.create!(email: 'maurice.frank@posteo.de', cooperative_id: 1, password: 'password', password_confirmation: 'password') if Rails.env.development?

Plant.create!(name: 'Betten Knoll', cooperative_id: 1, plant_type: 'solar', size: 46.55)
Plant.create!(name: 'Dagoberts Solarpark', cooperative_id: 2, plant_type: 'solar', size: 46.55)
Plant.create!(name: 'Dagoberts Windpark', cooperative_id: 2, plant_type: 'wind', size: 200)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Cooperative.create!(email: 'info@heg.de', address: 'Eppelheim', name: 'Heidelberger Energiegenossenschaft') if Rails.env.development?
Group.create!(name: 'Hanseatische Genossen') if Rails.env.development?
Group.create!(name: 'Badische Solarfachgruppe') if Rails.env.development?
Member.create!(email: 'maurice.frank@posteo.de', cooperative_id: 1, password: 'qwertz', password_confirmation: 'qwertz') if Rails.env.development?

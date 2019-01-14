def addmember(email, password, firstname, lastname, coop, admin)
    @member = Member.invite!(email: email, firstname: firstname, lastname: lastname, cooperative_id: coop, is_coop_admin: admin, is_board_member: admin) do |u|
        u.skip_invitation = true
    end
    token = @member.instance_variable_get(:@raw_invitation_token)
    Member.accept_invitation!(:invitation_token => token, :password => password, :password_confirmation => password)

    puts "Created User #{email} with password #{password}"
    @member
end

if Rails.env.development?
    Cooperative.create!(email: 'info@eeg.com', city: 'Entenhausen',name: 'Entenhausener Energiegenossenschaft',latitude: 53.2840, longitude: 9.75958, website: 'https://entenhausenener-energiegenossenschaft.com', coopnumber: 'P001', has_tariff: true)
    Cooperative.create!(email: 'info@msg.com',    city: 'Mouseton',   name: 'MausStrom Genossenschaft',        latitude: 53.2474, longitude: 12.0411, website: 'https://mausstrom.com',                             coopnumber: 'P002', has_tariff: false)

    # Entenhausen
    Plant.create!(name: 'DuckWindpark', cooperative_id: 1, plant_type: 'wind', peak_power: 46.55,  latitude: 54.2840, longitude: 9.76958)
    Plant.create!(name: 'DuckSolarpark',cooperative_id: 1, plant_type: 'solar',peak_power: 400.00, latitude: 53.4840, longitude: 9.72958)

    # Mouseton
    Plant.create!(name: 'StaudamMouseton', cooperative_id: 2, plant_type: 'wasser', peak_power: 22.22, latitude: 53.3074, longitude: 12.1411)
    Plant.create!(name: 'Minnies Windpark',cooperative_id: 2, plant_type: 'wind',  peak_power: 22.22, latitude: 53.2174, longitude: 12.3211)

    Admin.create!(email: 'admin@example.com', firstname: 'Admina', lastname: 'Lastname', password: 'password', password_confirmation: 'password')
    # Entenhausen
    addmember('dagobert@eeg.com','password', 'Dagobert','Duck', 1, true)
    addmember('donald@eeg.com',  'password', 'Donald',  'Duck', 1, false)
    addmember('daisy@eeg.com',   'password', 'Daisy',   'Duck', 1, false)

    # Mouseton
    addmember('mickey@msg.com', 'password', 'Mickey','Maus', 2, true)
    addmember('minnie@msg.com', 'password', 'Minnie','Maus', 2, false)
    addmember('goofy@msg.com',  'password', 'Goofy', 'Dawg', 2, false)
end

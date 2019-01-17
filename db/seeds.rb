def addmember(email, password, firstname, lastname, coop, admin, editor, customer_data)
    @member = Member.invite!(email: email, firstname: firstname, lastname: lastname, cooperative_id: coop, is_coop_admin: admin, is_board_member: admin, is_editor: editor, can_see_customer_data: customer_data) do |u|
        u.skip_invitation = true
    end
    token = @member.instance_variable_get(:@raw_invitation_token)
    Member.accept_invitation!(:invitation_token => token, :password => password, :password_confirmation => password)

    puts "Created User #{email} with password #{password}"
    @member
end

if Rails.env.development?
    Cooperative.create!(email: 'info@eeg.com', city: 'Entenhausen',name: 'Entenhausener Energiegenossenschaft',latitude: 53.2840, longitude: 9.75958, website: 'https://entenhausenener-energiegenossenschaft.com', coopnumber: 'M001', has_tariff: true)
    Cooperative.create!(email: 'info@msg.com',    city: 'Mouseton',   name: 'MausStrom Genossenschaft',        latitude: 53.2474, longitude: 12.0411, website: 'https://mausstrom.com',                             coopnumber: 'M002', has_tariff: false)

    # Entenhausen
    Plant.create!(name: 'Duck-Solarpark',        cooperative_id: 1, plant_type: 'solar',   peak_power: 400.00,latitude: 53.4840, longitude: 9.72958)
    Plant.create!(name: 'Duck-Windpark',         cooperative_id: 1, plant_type: 'wind',    peak_power: 46.55, latitude: 54.2840, longitude: 9.76958)
    Plant.create!(name: 'Duck-Wasserkraftwerk',  cooperative_id: 1, plant_type: 'wasser',  peak_power: 10.0,  latitude: 54.7, longitude: 9.68)
    Plant.create!(name: 'Duck-Biomassekraftwerk',cooperative_id: 1, plant_type: 'biomasse',peak_power: 200.0, latitude: 54.1, longitude: 9.45)
    Plant.create!(name: 'Duck-BHKW',             cooperative_id: 1, plant_type: 'bhkw',    peak_power: 99.0,  latitude: 54.4, longitude: 9.77)
    Plant.create!(name: 'Dagoberts Speicher',    cooperative_id: 1, plant_type: 'speicher',peak_power: 32.2,  latitude: 54.5, longitude: 9.21)

    # Mouseton
    Plant.create!(name: 'MickeySun',       cooperative_id: 2, plant_type: 'solar',   peak_power: 22.22, latitude: 53.66, longitude: 12.92)
    Plant.create!(name: 'Minnies Windpark',cooperative_id: 2, plant_type: 'wind',    peak_power: 22.22, latitude: 53.21, longitude: 12.32)
    Plant.create!(name: 'StaudamMouseton', cooperative_id: 2, plant_type: 'wasser',  peak_power: 22.22, latitude: 53.89, longitude: 12.19)
    Plant.create!(name: 'MausMasse',       cooperative_id: 2, plant_type: 'biomasse',peak_power: 22.22, latitude: 53.68, longitude: 12.68)
    Plant.create!(name: 'GoofyBHKW',       cooperative_id: 2, plant_type: 'bhkw',    peak_power: 22.22, latitude: 53.58, longitude: 12.47)
    Plant.create!(name: 'Plutos Speicher', cooperative_id: 2, plant_type: 'speicher',peak_power: 22.22, latitude: 53.27, longitude: 12.83)

    Admin.create!(email: 'admin@example.com', firstname: 'Admina', lastname: 'Lastname', password: 'password', password_confirmation: 'password')
    # Entenhausen
    addmember('dagobert@eeg.com', 'password', 'Dagobert', 'Duck',       1, true,  true,  true)
    addmember('donald@eeg.com',   'password', 'Donald',   'Duck',       1, false, true,  false)
    addmember('daisy@eeg.com',    'password', 'Daisy',    'Duck',       1, false, false, true)
    addmember('franz@eeg.com',    'password', 'Franz',    'Ganz',       1, false, true,  true)
    addmember('daniel@eeg.com',   'password', 'Daniel',   'Düsentrieb', 1, false, false, false)

    # Mouseton
    addmember('mickey@msg.com', 'password', 'Mickey', 'Maus', 2, true,  true,  true)
    addmember('minnie@msg.com', 'password', 'Minnie', 'Maus', 2, false, true,  false)
    addmember('goofy@msg.com',  'password', 'Goofy',  'Dawg', 2, false, false, true)
    addmember('pluto@msg.com',  'password', 'Pluto',  'Dawg', 2, false, true,  true)
    addmember('pete@msg.com',   'password', 'Pistol', 'Pete', 2, false, false, false)
end

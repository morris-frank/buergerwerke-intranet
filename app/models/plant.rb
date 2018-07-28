class Plant < ApplicationRecord
    belongs_to :cooperative

    def address
        address = ''
        if street?
            address += street + ', '
        end
        if  zip?
            address += zip + ', '
        end
        if city?
            address += city + ', '
        end
        address += 'Germany'
    end

    # geocoded_by :address
    # after_validation :geocode

    enum plant_type: [ :solar, :wind, :wasser, :biomasse, :bhkw, :speicher ]

    validates :name, presence: true
    validates :peak_power, allow_blank: true, numericality: { greater_than_or_equal_to: 1 }
    validates :annual_generation, allow_blank: true, numericality: { greater_than_or_equal_to: 1 }
    validates :plant_type, presence: true
    validates :latitude, allow_blank: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
    validates :longitude, allow_blank: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180}
    validates_format_of :zip, :with => /\d{5}/, :message => "sollte 5-stellige Nummer sein", allow_blank: true
end

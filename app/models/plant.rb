class Plant < ApplicationRecord
    belongs_to :cooperative

    enum plant_type: [ :solar, :wind, :wasser ]

    validates :name, presence: true
    validates :peak_power, allow_blank: true, numericality: { greater_than_or_equal_to: 1 }
    validates :annual_generation, allow_blank: true, numericality: { greater_than_or_equal_to: 1 }
    validates :plant_type, presence: true
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
    validates :longitude, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180}
end

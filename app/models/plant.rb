class Plant < ApplicationRecord
    belongs_to :cooperative

    enum plant_type: [ :solar, :wind, :water ]

    validates :name, presence: true
    validates :size, numericality: { greater_than_or_equal_to: 1 }
    validates :plant_type, presence: true
end

class Plant < ApplicationRecord
    belongs_to :cooperative

    enum plant_type: [ :solar, :wind, :water ]
end

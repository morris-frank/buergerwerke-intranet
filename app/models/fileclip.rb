class Fileclip < ApplicationRecord
    has_one_attached :file
    belongs_to :file_category

    scope :joined_coops, -> { joins("INNER JOIN fileclips_cooperatives ON fileclips.id = fileclips_cooperatives.fileclip_id") }

    has_many :fileclips_cooperatives
    has_many :cooperatives, through: :fileclips_cooperatives

    accepts_nested_attributes_for :cooperatives
    accepts_nested_attributes_for :fileclips_cooperatives

    validates :file, presence: true
    validates :file_category, presence: true
    validate :not_both_standards

    private
        def not_both_standards
            if self.is_standard && self.is_standard_with_tariff
                errors.add(:is_standard, 'kann nicht wahr sein, wenn auch Standarddatei für BEGs mit Tarif.')
                errors.add(:is_standard_with_tariff, 'kann nicht wahr sein, wenn auch generelle Standarddatei.')
            end
        end
end

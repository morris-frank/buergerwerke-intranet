class Fileclip < ApplicationRecord
    has_one_attached :file
    belongs_to :file_category

    has_many :fileclips_cooperatives
    has_many :cooperatives, through: :fileclips_cooperatives

    scope :joined_coops, -> { joins("INNER JOIN fileclips_cooperatives ON fileclips.id = fileclips_cooperatives.fileclip_id") }

    accepts_nested_attributes_for :cooperatives
    accepts_nested_attributes_for :fileclips_cooperatives

    validates :file, presence: true
    validates :file_category, presence: true
    validate :not_both_standards

    after_commit :clean_coops

    # Don't save Coop <-> File relations for standard files. Should be before commit, but couldnt make it... TODO
    def clean_coops
        if self.is_standard || self.is_standard_with_tariff
            FileclipsCooperative.where('fileclip_id = ?', self.id).delete_all
        end
    end

    private
        def not_both_standards
            if self.is_standard && self.is_standard_with_tariff
                errors.add(:is_standard, 'kann nicht wahr sein, wenn auch Standarddatei für BEGs mit Tarif.')
                errors.add(:is_standard_with_tariff, 'kann nicht wahr sein, wenn auch generelle Standarddatei.')
            end
        end
end

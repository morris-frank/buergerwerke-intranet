class Cooperative < ApplicationRecord
    has_many :members
    has_many :plants
    has_many :fileclips_cooperatives
    has_many :fileclips, through: :fileclips_cooperatives
    has_one_attached :customer_data_xls
    has_one_attached :customer_data_pdf

    accepts_nested_attributes_for :fileclips

    validates :name, presence: true
    validates :email, presence: true
    validates :address, presence: true
    validates :website, presence: false, :format => URI::regexp(%w(http https))
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
    validates :longitude, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180}
    validates :coopnumber, presence: true
    validate :coopnumber_style

    private
    def coopnumber_style
        if !(/[MP]\d{4}$/.match?(coopnumber))
            errors.add(:coopnumber, 'The Cooperative project number must be M or P followed by 4 decimals.')
        end
    end
end

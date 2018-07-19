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
    validates :city, presence: true
    validates :website, allow_blank: true, :format => URI::regexp(%w(http https))
    validates :latitude, allow_blank: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
    validates :longitude, allow_blank: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180}
    validates :coopnumber, presence: true
    validate :coopnumber_style
    validates_format_of :zip, :with => /\d{5}/, :message => "sollte 5-stellige Nummer sein", allow_blank: true

    private
        def coopnumber_style
            if !(/[MP]\d{3}$/.match?(coopnumber))
                errors.add(:coopnumber, 'sollte mit M oder P beginnen dann 3 stellige Nummer.')
            end
        end
end

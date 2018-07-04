class Cooperative < ApplicationRecord
    has_many :members
    has_many :plants
    has_many :fileclips_cooperatives
    has_many :fileclips, through: :fileclips_cooperatives

    accepts_nested_attributes_for :fileclips

    validates :name, presence: true
    validates :email, presence: true
    validates :address, presence: true
    validates :website, presence: false, :format => URI::regexp(%w(http https))
end

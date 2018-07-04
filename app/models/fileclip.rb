class Fileclip < ApplicationRecord
    has_one_attached :file

    has_many :fileclips_cooperatives
    has_many :fileclips_groups
    has_many :groups, through: :fileclips_groups
    has_many :cooperatives, through: :fileclips_cooperatives

    accepts_nested_attributes_for :groups
    accepts_nested_attributes_for :cooperatives
    accepts_nested_attributes_for :fileclips_groups
    accepts_nested_attributes_for :fileclips_cooperatives
end

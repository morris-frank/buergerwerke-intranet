class Fileclip < ApplicationRecord
    has_one_attached :file
    belongs_to :file_category

    has_many :fileclips_cooperatives
    has_many :fileclips_groups
    has_many :groups, through: :fileclips_groups
    has_many :cooperatives, through: :fileclips_cooperatives

    accepts_nested_attributes_for :groups
    accepts_nested_attributes_for :cooperatives
    accepts_nested_attributes_for :fileclips_groups
    accepts_nested_attributes_for :fileclips_cooperatives


    validates :name, presence: true
    validates :file, presence: true
    validates :file_category, presence: true
end

class Group < ApplicationRecord
    has_and_belongs_to_many :members, join_table: :groups_users

    has_many :fileclips_groups
    has_many :fileclips, through: :fileclips_groups

    accepts_nested_attributes_for :fileclips
end

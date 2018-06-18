class Group < ApplicationRecord
    has_and_belongs_to_many :members, joint_table: :groups_users
end

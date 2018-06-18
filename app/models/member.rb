class Member < User
    devise :invitable, :confirmable
    belongs_to :cooperative
    has_and_belongs_to_many :groups, joint_table: :groups_users
  end

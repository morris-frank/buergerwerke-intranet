class Member < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable :validatable
  # devise :invitable, :confirmable
  belongs_to :cooperative
  has_and_belongs_to_many :groups, joint_table: :groups_users
end

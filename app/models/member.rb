class Member < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :invitable, :confirmable, :registerable
  # devise :invitable, :confirmable, :registerable
  belongs_to :cooperative
  has_and_belongs_to_many :groups, joint_table: :groups_users

  before_save :inheritate_roles

  def inheritate_roles
    if self.is_coop_admin == true
      self.is_editor = true
      self.can_see_customer_data = true
    end
  end
end

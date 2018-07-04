class Member < User
  devise :confirmable
  belongs_to :cooperative
  has_many :groups_users
  has_many :groups, through: :groups_users

  before_save :inheritate_roles

  def inheritate_roles
    if self.is_coop_admin == true
      self.is_editor = true
      self.can_see_customer_data = true
    end
  end
end

class Member < User
  devise :invitable
  belongs_to :cooperative

  before_save :inheritate_roles

  validates :firstname, presence: true
  validates :lastname, presence: true

  def inheritate_roles
    if self.is_coop_admin == true
      self.is_editor = true
      self.can_see_customer_data = true
    end
  end
end

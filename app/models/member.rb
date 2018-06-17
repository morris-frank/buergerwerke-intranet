class Member < User
    devise :invitable, :confirmable
  end

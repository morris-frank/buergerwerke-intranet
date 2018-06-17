class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :trackable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end

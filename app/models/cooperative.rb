class Cooperative < ApplicationRecord
    has_many :members
    has_many :plants
end

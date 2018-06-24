class Cooperative < ApplicationRecord
    has_many :members
    has_many :plants

    validates :name, presence: true
    validates :email, presence: true
    validates :address, presence: true
    validates :website, presence: false, :format => URI::regexp(%w(http https))
end

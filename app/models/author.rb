class Author < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    validates :phone_number, length: { is: 10 }
end

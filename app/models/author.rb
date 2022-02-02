class Author < ApplicationRecord

    # all authors have a name & no two authors have the same name
    validates :name, presence: true, uniqueness: true
    # phone numbers are exactly ten digits
    validates :phone_number, length: { is: 10 }
    
end

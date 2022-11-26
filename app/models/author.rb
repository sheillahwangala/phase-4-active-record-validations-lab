class Author < ApplicationRecord
    # validates authors have a name, name cannot be emppty and is unique
    validates :name, presence: true, uniqueness: true

    # validates authors' phone numbers are exactly 10 digits
    validates :phone_number, length: { is:10 }
    
end

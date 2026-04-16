class Vet < ApplicationRecord
    has_many :appointments
    def name
        "#{first_name} #{last_name}"
    end
end

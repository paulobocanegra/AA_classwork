#   t.date "birth_date", null: false
#     t.string "color", null: false
#     t.string "name", null: false
#     t.string "sex", limit: 1, null: false
#     t.text "description", null: false
#  

class Cat < ApplicationRecord
    def age    
        now = Date.today
        birthday = self.birth_date
        years = (now.year - birthday.year)
        months = (now.month - birthday.month)
        "This cat is #{years} year(s) and #{months} month(s) old"
    end

    validates :color, inclusion: %w{Orange Gray Black Tuxedo White Other}
    validates :sex, inclusion: %w{M F}
    
end



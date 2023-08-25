class Cat < ApplicationRecord
    CAT_COLORS = ['red', 'green', 'blue']

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: { in: %w(M F)}

    def birth_date_cannot_be_future
       if birth_date.present? && birth_date > Date.today
        errors.add(:birth_date, "can't be in the future")
       end
    end

end

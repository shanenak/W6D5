require 'action_view'
require 'date'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['red', 'green', 'blue']

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: { in: %w(M F)}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(birth_date, "can't be in the future")
        end
    end

    def age
        Date.today.year - birth_date.year
    end

end

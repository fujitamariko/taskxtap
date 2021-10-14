class Task < ApplicationRecord
    validates :assortment, presence: true
    validates :content, presence: true
end
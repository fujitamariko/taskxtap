class Task < ApplicationRecord
    validates :assortment, presence: true
    validates :content, presence: true

    enum status: {未着手:0, 着手中:1, 完了:2}
    has_many :labellings, dependent: :destroy
    has_many :labels, through: :labellings
end
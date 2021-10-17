class Task < ApplicationRecord
    validates :assortment, presence: true
    validates :major_category, presence: true
    validates :medium_category, presence: true
    validates :sub_category, presence: true
    validates :content, presence: true
    validates :plan_hours, presence: true, numericality: {with: /^([1-9][0-9]{0,2}|0)(\.[0-9]{1,2})?$/}
    validates :spend_hours, numericality: {with: /^([1-9][0-9]{0,2}|0)(\.[0-9]{1,2})?$/}
    validates_inclusion_of :plan_hours, in:0..999
    validates_inclusion_of :spend_hours, in:0..999
    validates :deadline_on, presence: true
    validates :status, presence: true


    enum status: {未着手:0, 着手中:1, 完了:2}
    belongs_to :user
    has_many :labellings, dependent: :destroy
    has_many :labels, through: :labellings
    has_many :comments, dependent: :destroy
end
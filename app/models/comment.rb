class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :content, length: { maximum: 255 }, presence: true
end

class InterviewFeedback < ApplicationRecord
  belongs_to :organization
  belongs_to :interview
  belongs_to :user

  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :recommendation, presence: true
end

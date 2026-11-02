class Interview < ApplicationRecord
  belongs_to :organization
  belongs_to :recruitment_application, foreign_key: "application_id"
  has_many :interview_feedbacks, dependent: :destroy

  validates :scheduled_at, presence: true
end

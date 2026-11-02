class Task < ApplicationRecord
  belongs_to :organization
  belongs_to :assignee, class_name: "User"

  validates :subject, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end

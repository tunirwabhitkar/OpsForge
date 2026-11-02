class Ticket < ApplicationRecord
  belongs_to :organization
  belongs_to :requester, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true
  has_many :ticket_comments, dependent: :destroy
  has_many :ticket_events, dependent: :destroy

  validates :subject, presence: true
  validates :status, presence: true
  validates :priority, presence: true
end

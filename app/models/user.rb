class User < ApplicationRecord
  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
  has_many :assigned_deals, class_name: "Deal", foreign_key: "assigned_to_id"
  has_many :assigned_companies, class_name: "Company", foreign_key: "assigned_to_id"
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assignee_id"
  has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assignee_id"
  has_many :requested_tickets, class_name: "Ticket", foreign_key: "requester_id"
  has_many :authored_articles, class_name: "Article", foreign_key: "author_id"
  has_many :notifications, foreign_key: "recipient_id", dependent: :destroy

  validates :email, presence: true, uniqueness: { case_insensitive: true }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

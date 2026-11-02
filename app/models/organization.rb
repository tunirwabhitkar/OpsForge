class Organization < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :invitations, dependent: :destroy

  has_many :companies, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :deals, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :tasks, dependent: :destroy

  has_many :jobs, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :recruitment_applications, dependent: :destroy
  has_many :interviews, dependent: :destroy
  has_many :interview_feedbacks, dependent: :destroy

  has_many :categories, dependent: :destroy
  has_many :articles, dependent: :destroy

  has_many :tickets, dependent: :destroy
  has_many :integrations, dependent: :destroy
  has_many :webhooks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end

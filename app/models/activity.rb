class Activity < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  validates :activity_type, presence: true
  validates :subject, presence: true

  TYPES = %w[call email meeting note].freeze
  validates :activity_type, inclusion: { in: TYPES }
end

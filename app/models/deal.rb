class Deal < ApplicationRecord
  belongs_to :organization
  belongs_to :company, optional: true
  belongs_to :assigned_to, class_name: "User", optional: true
  has_many :activities, as: :trackable, dependent: :destroy

  validates :name, presence: true
  validates :stage, presence: true

  STAGES = %w[lead qualified proposal closed_won closed_lost].freeze
  validates :stage, inclusion: { in: STAGES }
end

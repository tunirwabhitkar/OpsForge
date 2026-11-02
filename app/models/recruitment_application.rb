class RecruitmentApplication < ApplicationRecord
  self.table_name = "applications"

  belongs_to :organization
  belongs_to :job
  belongs_to :candidate
  has_many :interviews, dependent: :destroy

  validates :stage, presence: true

  STAGES = %w[applied screening interview offer hired rejected].freeze
  validates :stage, inclusion: { in: STAGES }
end

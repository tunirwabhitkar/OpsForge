class Job < ApplicationRecord
  belongs_to :organization
  has_many :recruitment_applications, dependent: :destroy
  has_many :candidates, through: :recruitment_applications

  validates :title, presence: true
  validates :status, presence: true
end

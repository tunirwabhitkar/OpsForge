class Candidate < ApplicationRecord
  belongs_to :organization
  has_many :recruitment_applications, dependent: :destroy
  has_many :jobs, through: :recruitment_applications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

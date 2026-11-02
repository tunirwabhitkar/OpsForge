class Integration < ApplicationRecord
  belongs_to :organization

  validates :provider, presence: true
  validates :status, presence: true
end

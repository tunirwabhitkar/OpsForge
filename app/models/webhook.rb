class Webhook < ApplicationRecord
  belongs_to :organization

  validates :source, presence: true
  validates :payload, presence: true
end

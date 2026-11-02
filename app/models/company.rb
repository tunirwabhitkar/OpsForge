class Company < ApplicationRecord
  belongs_to :organization
  belongs_to :assigned_to, class_name: "User", optional: true

  has_many :contacts, dependent: :destroy
  has_many :deals, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  validates :name, presence: true
end

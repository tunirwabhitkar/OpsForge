class Contact < ApplicationRecord
  belongs_to :organization
  belongs_to :company, optional: true
  has_many :activities, as: :trackable, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

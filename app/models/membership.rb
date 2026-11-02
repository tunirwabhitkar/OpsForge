class Membership < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  enum :role, { owner: 0, admin: 1, manager: 2, member: 3, reader: 4 }

  validates :user_id, uniqueness: { scope: :organization_id }
end

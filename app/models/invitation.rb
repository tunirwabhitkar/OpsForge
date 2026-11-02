class Invitation < ApplicationRecord
  belongs_to :organization
  belongs_to :invited_by, class_name: "User"

  enum :role, { owner: 0, admin: 1, manager: 2, member: 3, reader: 4 }

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :token, presence: true, uniqueness: true

  before_validation :generate_token, on: :create
  before_validation :set_expiration, on: :create

  private

  def generate_token
    self.token = SecureRandom.hex(20) if token.blank?
  end

  def set_expiration
    self.expires_at ||= 7.days.from_now
  end
end

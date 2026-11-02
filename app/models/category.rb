class Category < ApplicationRecord
  belongs_to :organization
  has_many :articles, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end

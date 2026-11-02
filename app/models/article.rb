class Article < ApplicationRecord
  belongs_to :organization
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_rich_text :content
  has_many :article_revisions, dependent: :destroy

  validates :title, presence: true
  validates :slug, presence: true
  validates :status, presence: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end
end

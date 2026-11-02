class ArticleRevision < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :title, presence: true
  validates :version, presence: true
end

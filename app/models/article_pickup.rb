class ArticlePickup < ApplicationRecord
  has_many :article_selections
  has_many :articles, through: :article_selections
  validates :title, presence: true, uniqueness: true
  validates :content_type, presence: true
  default_scope { order('created_at desc') }
end

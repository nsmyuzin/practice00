class ArticleSelection < ApplicationRecord
  belongs_to :article_pickup
  belongs_to :article
end

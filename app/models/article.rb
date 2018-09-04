class Article < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :sentence, presence: true
end

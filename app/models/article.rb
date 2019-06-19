class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :content
  has_many :article_selections
  has_many :article_pickup, through: :article_selections
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :sentence, presence: true
  default_scope { includes(:content) }
  default_scope { order('articles.created_at desc') }

  def self.search(search)
    if search
      where(['articles.name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def previous
    Article.where("id < ? and articles.created_at <= ?", id, created_at).order("id DESC").first
  end

  def next
    Article.where("id > ? and articles.created_at >= ?", id, created_at).order("id DESC").reverse.first
  end

end

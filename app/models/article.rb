class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :content
  has_many :side_items
  accepts_nested_attributes_for :side_items, allow_destroy: true
  has_many :article_selections
  has_many :article_pickup, through: :article_selections
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :sentence, presence: true
  default_scope { eager_load(:content) }
  default_scope { order('articles.created_at desc') }
  ## 公開フラグ=trueかつ(公開期間が該当もしくは空)の場合公開
  scope :open, -> { where('articles.display_flag = ? and (? between articles.from_display and articles.to_display or (articles.from_display is null and articles.to_display is null))', true, Time.zone.now ) }

  def self.search(search)
    if search
      where(['articles.name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def items(place)
    self.side_items.where("place = ?",  place).order(:order)
  end

  def previous
    Article.where('contents.url = ?', content.url).open.where("articles.id < ? and articles.created_at <= ?", id, created_at).order("articles.id DESC").first
  end

  def next
    Article.where('contents.url = ?', content.url).open.where("articles.id > ? and articles.created_at >= ?", id, created_at).order("articles.id DESC").reverse.first
  end

end

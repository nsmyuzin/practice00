class Article < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :sentence, presence: true
  default_scope { order('created_at desc') }

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def previous
    Article.where("id < ? and created_at <= ?", id, created_at).order("id DESC").first
  end

  def next
    Article.where("id > ? and created_at >= ?", id, created_at).order("id DESC").reverse.first
  end

end

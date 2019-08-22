class ArticlePickup < ApplicationRecord
  has_many :article_selections
  has_many :articles, through: :article_selections
  accepts_nested_attributes_for :article_selections, allow_destroy: true
  validates :title, presence: true, uniqueness: true
  #validates :content_type, presence: true
  default_scope { order('created_at desc') }

  def custom_update!(args)
    transaction do
      article_selections.destroy_all if article_selections.present?
      assign_attributes(args)
      save
    end
  end

  private

end

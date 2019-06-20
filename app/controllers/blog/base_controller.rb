class Blog::BaseController < ApplicationController
  layout 'blog'
  before_action :load_default
  after_action :load_side_items

  private
  def load_default
    @new_articles = Article.open.limit(5)
    @categories = Category.all
  end
  def load_side_items
    @l_side_items = @article.items(SideItem::PLACE_LEFT) if @article
    @r_side_items = @article.items(SideItem::PLACE_RIGHT) if @article
  end
end

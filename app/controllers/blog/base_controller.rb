class Blog::BaseController < ApplicationController
  before_action :load_default

  private
  def load_default
    @new_articles = Article.limit(5)
    @categories = Category.all
  end

end

class Blog::ArticlesController < ApplicationController
  before_action :load_article, only: [:show]
  before_action :load_articles, only: [:show,:index]
  before_action :load_categories
  def show
  end

  def index
  end

  private
  def load_article
    @article = Article.find(params[:id])
  end

  def load_articles
    @articles = Article.all
  end

  def load_categories
    @categories = Category.all
  end

  def article_params
    params.require(:article).permit(:id)
  end

end

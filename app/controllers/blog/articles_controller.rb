class Blog::ArticlesController < Blog::BaseController
  before_action :load_article, only: [:show]
  before_action :load_articles, only: [:index]
  def show
  end

  def index
  end

  private
  def load_article
    @article = Article.find(params[:id])
  end
  def load_articles
    @articles = Article.page(params[:page]).search(params[:search])
  end

  def article_params
    params.require(:article).permit(:id)
  end

end

class Blog::CategoriesController < Blog::BaseController
  before_action :load_articles, only: [:show]

  def show
    render :template => "blog/articles/index"
  end

  private
  def load_articles
    @category = Category.find(params[:id])
    @articles = @category.articles.page(params[:page])
  end
end

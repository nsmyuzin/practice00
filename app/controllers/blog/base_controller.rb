class Blog::BaseController < ApplicationController
  before_action :load_default
  before_action :load_banner #TODO fix

  private
  def load_default
    @new_articles = Article.limit(5)
    @categories = Category.all
  end
  def load_banner
    @right_banner= Banner.find(1)
    @left_banner= Banner.find(2)
  end

end

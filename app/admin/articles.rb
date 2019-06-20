ActiveAdmin.register Article do
  menu parent: "投稿"
  permit_params do
    permitted = [:id, :content_id, :name, :sentence, :category_id, :image, :title, :meta_keyword, :meta_description, :display_flag, :from_display, :to_display]
    permitted << [side_items_attributes: [:item_type, :item_id, :order, :template, :place ]] if params[:action] == 'create'
    permitted << [side_items_attributes: [:item_type, :item_id, :order, :template, :place, :id, :_destroy]] if params[:action] == 'update'
    permitted
  end

  index do
    selectable_column
    column :content
    column :name
    column :category
    column :image do |obj|
      link_to(obj.image,obj.image.url, target: "_blank")
    end
    column :display_flag
    actions do |article|
      item "画像編集", image_edit_admin_article_path(article.id), class: "member_link"
      item "Preview", article_path(article.content.url,article.id), class: "member_link", target: "_blank"
    end
  end

  member_action :image_edit, :method => :get do
    @article = Article.find(params[:id])
  end

  member_action :image_update, :method => :post do
    @article = Article.find(params[:id])
    @article.image = params[:blob]
    if @article.save
      render json: '{"status": "success"}'
    else
      render json: '{"status": "error"}'
    end
  end

  controller do
    def new
      @article = Article.new
      @article.side_items.build
    end
    def create
      @article = Article.new(post_params)
      if @article.save
        redirect_to admin_articles_path
      else
        render "_edit_article", layout: "active_admin"
      end
    end

    def edit
      @article = Article.find(params[:id])
      @article.side_items.build if @article.side_items.blank?
    end
    def update
      @article = Article.find(params[:id])
      if @article.update(post_params)
        redirect_to admin_articles_path
      else
        render "_edit_article", layout: "active_admin"
      end
    end

    private
    def post_params
      permitted_params[:article]
    end
  end

  form partial: 'edit_article'
end

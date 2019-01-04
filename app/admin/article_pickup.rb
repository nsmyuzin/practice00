ActiveAdmin.register ArticlePickup do
  permit_params :title, :discription, :content_type, article_ids: []

  index do
    selectable_column
    column :title
    column :content_type
    actions do |article|
      #item "Preview", blog_article_path(article.id), class: "member_link", target: "_blank"
    end
  end

  controller do
    def create
      @article_pickup = ArticlePickup.new
      if @article_pickup.custom_update!(post_params)
        redirect_to collection_path
      else
        render "_edit_pickup_article", layout: "active_admin"
      end
    end

    def update
      @article_pickup = ArticlePickup.find(params["id"])
      if @article_pickup.custom_update!(post_params)
        redirect_to collection_path
      else
        render "_edit_pickup_article", layout: "active_admin"
      end
    end

    private
    def post_params
      permitted_params[:article_pickup]
    end
  end

  form partial: 'edit_pickup_article'

end

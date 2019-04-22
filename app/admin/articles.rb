ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :content_id, :name, :sentence, :category_id, :image, :title, :meta_keyword, :meta_description
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

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

  index do
    selectable_column
    column :content
    column :id
    column :name
    column :category
    column :image do |obj|
      link_to(obj.image,obj.image.url, target: "_blank")
    end
    actions do |article|
      item "画像編集", image_edit_admin_article_path(article.id), class: "member_link"
      item "Preview", blog_article_path(article.id), class: "member_link", target: "_blank"
    end
  end

  controller do
  end

  form partial: 'edit_article'
end

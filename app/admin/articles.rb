ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :name, :sentence, :category_id, :image, :title, :meta_keyword, :meta_description
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    column :id
    column :name
    column :category
    column :image do |obj|
      link_to(obj.image,obj.image.url, target: "_blank")
    end
    actions do |article|
      item "Preview", blog_article_path(article.id), class: "member_link", target: "_blank"
    end
  end

  controller do
  end

  form partial: 'edit_article'

end

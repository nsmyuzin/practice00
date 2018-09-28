ActiveAdmin.register ArticlePickup do
  permit_params :title, :content_type

  index do
    selectable_column
    column :title
    column :content_type
    actions do |article|
      #item "Preview", blog_article_path(article.id), class: "member_link", target: "_blank"
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content_type,
        as: :select,
        collection: Category.tree_type_order.map { |c| [c.name, c.id] }
        #collection: Category.tree_type_order.map { |c| ['-' * c.depth + c.name, c.id] }
      f.input :discription, :as => :ckeditor
    end
    f.semantic_errors
    f.actions
  end

end

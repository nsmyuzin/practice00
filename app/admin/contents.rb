ActiveAdmin.register Content do
  permit_params :name, :sub_name, :description, :url, :template, :title, :meta_keyword, :meta_description

  index do
    selectable_column
    column :name
    column :url
    column :template
    actions do |content|
 ##     item "Preview", blog_article_path(article.id), class: "member_link", target: "_blank"
    end
  end
end

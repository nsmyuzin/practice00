ActiveAdmin.register Category do
  menu parent: "投稿"
  config.filters = false # the default filters don't work unfortunately
  permit_params :name, :parent_id #, category_hierarchies: [:ancestor_id, :descendant_id, :generations]

  sortable tree: true,
    sorting_attribute: :id,
    parent_method: :parent,
    children_method: :children,
    roots_method: :roots

  index :as => :sortable do
    label :name # item content
    actions
  end
end

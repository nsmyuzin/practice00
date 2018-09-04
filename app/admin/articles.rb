ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :sentence, :category_id
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs do
      f.input :title
      f.input :category_id,
        as: :select,
        collection: Category.tree_type_order.map { |c| [c.name, c.id] }
        #collection: Category.tree_type_order.map { |c| ['-' * c.depth + c.name, c.id] }
      f.input :sentence
    end
    f.semantic_errors
    f.actions
  end

  controller do
  end

end

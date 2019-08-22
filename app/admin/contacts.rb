ActiveAdmin.register Contact do

  menu label: "問い合わせ", priority: 9 ##タグ設定
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    column :id
    column :created_at
    column :full_name
    column :title
    actions
  end

end

ActiveAdmin.register BasicInfo do
  menu parent: "サイト設定", url: '/admin/basic_infos/1/edit' ##タグ設定

  actions :all, except: [:new, :create, :destroy]
  permit_params :name, :sub_name, :sentence, :header_logo, :footer_logo, :copyright, :title, :meta_description, :meta_keyword, :to_system_email, :from_system_email, :public_email, :email1

  index do
    column :name
    column :sub_name
    column :header_logo do |topic|
      topic.header_logo.present? ? link_to(topic.header_logo.file.filename, topic.header_logo.url) : nil
    end
    column :footer_logo do |topic|
      topic.footer_logo.present? ? link_to(topic.footer_logo.file.filename, topic.footer_logo.url) : nil
    end
    actions defaults: false do |post|
      item "閲覧", admin_basic_info_path(post), class: "member_link"
      item "編集", edit_admin_basic_info_path(post), class: "member_link"
    end
  end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

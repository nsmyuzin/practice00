ActiveAdmin.register BasicInfo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :title, :sub_title, :sentence, :header_logo, :footer_logo, :copyright

  index do
    column :title
    column :sub_title
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
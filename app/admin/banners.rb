ActiveAdmin.register Banner do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :m_title, :title, :alt, :width, :height, :image_url, :link_url

  index do
    selectable_column
    column :m_title
    column :image_url do |banner|
      banner.image_url.present? ? link_to(image_tag(banner.image_url, width:100, height:100),banner.image_url, target:'_blank') : nil
    end
    column :width
    column :height
    actions
  end

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

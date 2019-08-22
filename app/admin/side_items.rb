ActiveAdmin.register SideItem do
  permit_params do
    permitted = [:item_id, :item_type, :place, :templete, :id, :order]
    permitted
  end
  menu false
  actions :all, except: [:new, :create, :destroy]

  collection_action :ajax_model_and_tmp, method: :post do
    if params[:select_column] == 'item_type'
      text_column = eval(SideItem::MODEL_TYPES[params[:side_items][:item_type]]).has_attribute?(:name) ? :name : :title
      model_instance = eval(SideItem::MODEL_TYPES[params[:side_items][:item_type]]).all.pluck(text_column, :id)
      model_instance = [['','']] if model_instance.blank?
    end
    template_code_array = SideItem::PLACE_TEMPLATES[params[:side_items][:place].to_i] & SideItem::MODEL_TEMPLATES[params[:side_items][:item_type]] || []
    template = SideItem::TEMPLATES.select{|key, value| template_code_array.include?(key)}.map{|name,key| [key,name]}
    template = [['','']] if template.blank?
    @select_options = {item_id: model_instance, template: template}
    respond_to do |format|
      format.json {render :json => @select_options}
    end
  end
end

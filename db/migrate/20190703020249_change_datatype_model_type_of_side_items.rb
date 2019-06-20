class ChangeDatatypeModelTypeOfSideItems < ActiveRecord::Migration[5.2]
  def change
    change_column :side_items, :model_type, :string
    change_column :side_items, :template, 'integer USING CAST(template AS integer)'
    rename_column :side_items, :model_type, :item_type
    rename_column :side_items, :model_id, :item_id
  end
end

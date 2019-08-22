class RenameDiscriptionColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :discription, :description
    rename_column :article_pickups, :discription, :description
  end
end

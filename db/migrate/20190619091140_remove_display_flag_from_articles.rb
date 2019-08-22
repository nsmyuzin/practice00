class RemoveDisplayFlagFromArticles < ActiveRecord::Migration[5.2]
  def up
    remove_column :articles, :display_flag, :integer
  end
  def down
    add_column :articles, :display_flag, :integer, null:false, default: true, comment: '公開フラグ'
  end
end

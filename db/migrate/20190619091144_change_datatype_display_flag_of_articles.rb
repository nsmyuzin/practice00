class ChangeDatatypeDisplayFlagOfArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :display_flag, :boolean, null:false, default: true, comment: '公開フラグ'
  end
end

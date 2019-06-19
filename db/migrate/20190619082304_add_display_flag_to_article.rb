class AddDisplayFlagToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :display_flag, :integer, null:false, default: true, comment: '公開フラグ'
    add_column :articles, :from_display, :datetime, comment: '公開開始日時'
    add_column :articles, :to_display, :datetime, comment: '公開終了日時'
  end
end

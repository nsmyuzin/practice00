class AddImageToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image, :string, comment: 'イメージ画像'
  end
end

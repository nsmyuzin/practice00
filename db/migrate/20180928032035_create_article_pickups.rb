class CreateArticlePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :article_pickups do |t|
      t.string :title, comment: 'タイトル'
      t.text :discription, comment: '説明'
      t.integer :content_type, commnt: 'コンテンツタイプ'
      t.timestamps
    end
  end
end

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name, comment: "記事タイトル", null: false, unique: true
      t.text :sentence, comment: "文章", null: false

      t.timestamps
    end
  end
end

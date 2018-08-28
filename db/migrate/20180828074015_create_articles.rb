class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, comment: "タイトル", null: false, unique: true
      t.text :sentence, comment: "文章", null: false

      t.timestamps
    end
  end
end

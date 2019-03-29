class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name, comment: "コンテンツ名", null: false, unique: true
      t.string :sub_name, comment: "コンテンツ名サブ"
      t.text :discription, comment: "コンテンツ説明文"
      t.string :url, comment: "url", null: false, unique: true
      t.integer :template, comment: "使用テンプレート"
      t.string :title, comment: "タイトル"
      t.text :meta_description, comment: "タグディスクリプション"
      t.string :meta_keyword, comment: "タグキーワード"

      t.timestamps
    end
  end
end

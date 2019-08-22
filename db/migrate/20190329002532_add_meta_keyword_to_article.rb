class AddMetaKeywordToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :title, :string, comment: 'タイトル'
    add_column :articles, :meta_keyword, :string, comment: 'メタキーワード'
    add_column :articles, :meta_description, :text, comment: 'メタディスクリプション'
  end
end

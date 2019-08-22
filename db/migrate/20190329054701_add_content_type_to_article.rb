class AddContentTypeToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :content, foreign_key: true , comment: 'コンテンツタイプ'
  end
end

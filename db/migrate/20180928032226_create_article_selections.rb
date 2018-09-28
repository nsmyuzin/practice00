class CreateArticleSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :article_selections do |t|
      t.references :article_pickup, foreign_key: true
      t.references :article, foreign_key: true
    end
  end
end

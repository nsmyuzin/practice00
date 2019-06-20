class CreateSideItems < ActiveRecord::Migration[5.2]
  def change
    create_table :side_items do |t|
      t.references :article, comment: "記事ID", null:false, foreign_key: true
      t.integer :model_id, comment: "モデルID", null: false
      t.integer :model_type, comment: "モデルタイプ", null: false
      t.integer :place, comment: "配置可能箇所", null:false
      t.integer :order, comment: "順番", null:false
      t.string :template, commnet: "使用テンプレート", null: false
    end
  end
end

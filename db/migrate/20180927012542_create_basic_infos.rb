class CreateBasicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_infos do |t|
      t.string :title, comment: 'サイトタイトル', null: false, unique: true
      t.string :sub_title, comment: 'サイトサブタイトル'
      t.text :sentence, comment: 'サイト説明文'
      t.string :header_logo, comment: 'ヘッダーロゴ'
      t.string :footer_logo, comment: 'フッターロゴ'
      t.string :copyright, comment: 'コピーライト'
      t.timestamps
    end
  end
end

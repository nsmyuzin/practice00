class CreateBasicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_infos do |t|
      t.string :name, comment: 'サイト名', null: false, unique: true
      t.string :sub_name, comment: 'サイト名サブ'
      t.text :sentence, comment: 'サイト説明文'
      t.string :header_logo, comment: 'ヘッダーロゴ'
      t.string :footer_logo, comment: 'フッターロゴ'
      t.string :copyright, comment: 'コピーライト'
      t.timestamps
    end
  end
end

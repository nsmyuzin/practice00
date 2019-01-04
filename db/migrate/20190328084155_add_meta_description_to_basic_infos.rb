class AddMetaDescriptionToBasicInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :basic_infos, :title, :string, comment: 'サイトタイトル'
    add_column :basic_infos, :meta_keyword, :string, comment: 'メタキーワード'
    add_column :basic_infos, :meta_description, :text, comment: 'メタディスクリプション'
  end
end

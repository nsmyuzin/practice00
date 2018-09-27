class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.string :m_title, comment: '管理用タイトル', null:false
      t.string :title, comment: 'タイトル'
      t.string :alt, comment: 'alt'
      t.integer :width, comment: '縦幅'
      t.integer :height, comment: '横幅'
      t.string :image_url, comment: '画像URL', null:false
      t.string :link_url, comment: 'リンク', null:false

      t.timestamps
    end
  end
end

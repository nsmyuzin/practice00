class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name, comment: "名", null: false
      t.string :family_name, comment: "姓", null: false
      t.string :email, comment: "メールアドレス", null: false
      t.string :title, comment: "件名", null: false
      t.text :message, comment: "本文", null: false
      t.timestamps
    end
  end
end

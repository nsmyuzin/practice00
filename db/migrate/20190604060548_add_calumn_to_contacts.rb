class AddCalumnToContacts < ActiveRecord::Migration[5.2]
  def up
    add_column :contacts, :full_name, :string
    change_column_null :contacts, :full_name, false, '名無し'
    change_column_comment :contacts, :full_name, 'フルネーム'
    change_column_null :contacts, :first_name, true
    change_column_null :contacts, :family_name, true
  end

  def down
    remove_column :contacts, :full_name, :string
    change_column_null :contacts, :first_name, false
    change_column_null :contacts, :family_name, false
  end

end

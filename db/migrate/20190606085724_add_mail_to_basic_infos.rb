class AddMailToBasicInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :basic_infos, :from_system_email, :string, null:false, default: 'sample@sample.com', comment: 'システムメール(from)'
    add_column :basic_infos, :to_system_email, :string, null:false, default: 'sample@sample.com', comment: 'システムメール(to)'
    add_column :basic_infos, :public_email, :string, null:false, default: 'sample@sample.com', comment: '公開メールアドレス'
    add_column :basic_infos, :email1, :string
  end
end

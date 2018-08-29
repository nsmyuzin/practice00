class Category < ApplicationRecord
  has_closure_tree ##閉包テーブルclosure_tree用
  validates :name, presence: true
end

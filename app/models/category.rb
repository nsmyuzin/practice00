class Category < ApplicationRecord
  has_closure_tree ##閉包テーブルclosure_tree用
  has_many :articles
  validates :name, presence: true, uniqueness: true

  ##tree表示用
  def self.tree_type_order
    ##postgres用
    query = <<-SQL
  SELECT c.id,CONCAT(depth,c.name) AS name
  FROM (
  SELECT h.descendant_id,
  STRING_AGG('','-') AS depth,
  STRING_AGG(LPAD(CAST(h.ancestor_id AS text), 2, '0'), '-' ORDER BY h.generations DESC) AS path
  FROM category_hierarchies AS h
  GROUP BY h.descendant_id
  ) AS t
  INNER JOIN categories AS c
  ON c.id = t.descendant_id
  ORDER BY path asc
    SQL
    self.find_by_sql(query)
  end
end

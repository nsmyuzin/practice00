# frozen_string_literal: true

class SideItem < ApplicationRecord
  # #item_type
  MODEL_ARTICLE = 'Article'
  MODEL_A_PICKUP = 'ArticlePickup'
  MODEL_BANNER = 'Banner'
  MODEL_CATEGORY = 'Category'
  MODEL_TYPES = { MODEL_ARTICLE => 'Article', MODEL_A_PICKUP => 'ArticlePickup',
                  MODEL_BANNER => 'Banner', MODEL_CATEGORY => 'Category' }.freeze
  # #place
  PLACE_COMMON = 0; PLACE_LEFT = 1; PLACE_RIGHT = 2
  PLACE = { PLACE_LEFT => 'LEFT', PLACE_RIGHT => 'RIGHT' }.freeze
  # #template
  TEMPLATE_BANNER = 1
  TEMPLATE_CATEGORIES = 2
  TEMPLATE_LIST_1 = 3
  TEMPLATE_CARD = 4
  TEMPLATES = { TEMPLATE_BANNER => 'banner',
                TEMPLATE_CATEGORIES => 'categories',
                TEMPLATE_LIST_1 => 'list_type1',
                TEMPLATE_CARD => 'card' }.freeze
  # #templete within place
  P_COMMON_TEMPLATES = [TEMPLATE_BANNER].freeze
  PLACE_TEMPLATES = { PLACE_LEFT => [],
                      PLACE_RIGHT => [TEMPLATE_CATEGORIES, TEMPLATE_LIST_1, TEMPLATE_CARD] }.freeze
  PLACE_TEMPLATES.each_value { |value| value.push(P_COMMON_TEMPLATES).flatten! }
  # #templete within model
  M_COMMON_TEMPLATES = [].freeze
  MODEL_TEMPLATES = { MODEL_ARTICLE => [],
                      MODEL_A_PICKUP => [TEMPLATE_LIST_1],
                      MODEL_BANNER => [TEMPLATE_BANNER],
                      MODEL_CATEGORY => [TEMPLATE_CATEGORIES] }.freeze
  MODEL_TEMPLATES.each_value { |value| value.push(M_COMMON_TEMPLATES).flatten! }
  belongs_to :article
  validates :article, presence: true
  validates :item_id, presence: true
  validates :item_type, presence: true
  validates :place, presence: true
  validates :order, presence: true
  validates :template, presence: true

  def m_instances
    MODEL_TYPES.keys.include?(item_type) ? eval(MODEL_TYPES[item_type]).all : []
  end
end

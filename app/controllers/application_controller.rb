class ApplicationController < ActionController::Base
  before_action :load_basic_info

  def set_meta_tags(page_title, meta_discription, meta_keywords)
   @page_title = page_title
   @meta_discription = meta_discription
   @meta_keywords = meta_keywords
  end

  private
  def load_basic_info
    @basic_info = BasicInfo.first
  end
end

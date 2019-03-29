class ApplicationController < ActionController::Base
  before_action :load_basic_info

  def set_meta_tags(page_title, meta_description, meta_keywords)
   @page_title = page_title
   @meta_description = meta_description
   @meta_keywords = meta_keywords
  end

  private
  def load_basic_info
    @basic_info = BasicInfo.first
  end
end

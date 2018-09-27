class ApplicationController < ActionController::Base
  before_action :load_basic_info

  private
  def load_basic_info
   @basic_info = BasicInfo.first
  end
end

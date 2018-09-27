module ApplicationHelper

  def page_title
    title = @basic_info.title
    title = @page_title + " | " + title if @page_title
    return title
  end

end

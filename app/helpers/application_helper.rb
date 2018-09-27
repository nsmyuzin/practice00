module ApplicationHelper

  def simple_time(time)##表示を見やすい日本時間に変更
    time.strftime("%Y-%m-%d %H:%M")
  end
  def simple_day(time)##表示を見やすい日本日付に変更
    time.strftime("%Y-%m-%d")
  end

  def page_title
    title = @basic_info.title
    title = @page_title + " | " + title if @page_title
    return title
  end

end

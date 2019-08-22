module ApplicationHelper

  def simple_time(time)##表示を見やすい日本時間に変更
    time.strftime("%Y-%m-%d %H:%M")
  end
  def simple_day(time)##表示を見やすい日本日付に変更
    time.strftime("%Y-%m-%d")
  end

  def default_meta_tags
    {
      title: (@page_title.present? ? (@page_title + " | " + @basic_info.title) : @basic_info.title),
      description: (@meta_description.present? ? @meta_description : @basic_info.meta_description),
      keywords: (@meta_keywords.present? ? @meta_keywords : @basic_info.meta_keyword),
      charset: "utf-8",
      viewport: "width=device-width, initial-scale=1.0",
      noindex: ! Rails.env.production?,
      robots: "noimageindex,noarchive",
      og: {
      }
    }
  end
end

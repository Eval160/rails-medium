module ApplicationHelper
  def truncate_rich_text(rich_text, length = 10, omission = '')
    truncate(rich_text.body.html_safe.gsub(/(<[^>]+>)/, ''), length: length, omission: omission)
  end
end

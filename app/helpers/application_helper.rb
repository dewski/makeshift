module ApplicationHelper
  def flash_notice
    return if flash.empty?
    flash.collect do |key, value|
      content_tag(:div, value, class: "flash #{key}")
    end.join.html_safe
  end
end

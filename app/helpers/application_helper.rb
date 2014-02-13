module ApplicationHelper
  def display_notice
    content_tag(:p, flash[:notice], class: 'bg-success') if flash[:notice]
  end

  def display_alert
    content_tag(:p, flash[:alert], class: 'bg-danger') if flash[:alert]
  end
end
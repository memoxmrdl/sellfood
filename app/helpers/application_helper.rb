module ApplicationHelper
  def message_notice(notice)
    content_tag(:p, notice, class: 'notice') if notice
  end

  def message_alert(alert)
    content_tag(:p, alert, class: 'alert') if alert
  end
end

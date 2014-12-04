module ApplicationHelper
  include TagsHelper

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        "alert-info"
    end
  end

  def history_url(model_name, params)
    send "#{model_name}_history_url", params
  end
end

module ApplicationHelper
  include TagsHelper

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def history_url(model_name, params)
    send "#{model_name}_history_url", params
  end
end

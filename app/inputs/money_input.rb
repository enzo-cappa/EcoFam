class MoneyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type] = 'number'
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    addon = template.content_tag(:div, I18n.t('number.currency.format.unit'), class: 'input-group-addon')
    input = @builder.text_field(attribute_name, merged_input_options)
    "#{addon} #{input}".html_safe
#    template.content_tag(:span, object.send(attribute_name), class: 'uneditable-input')
  end
end

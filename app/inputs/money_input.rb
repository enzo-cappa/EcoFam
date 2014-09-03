class MoneyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    "#{template.content_tag(:span, I18n.t('number.currency.format.unit'), class: 'add-on')} #{@builder.text_field(attribute_name, input_html_options)}".html_safe
#    template.content_tag(:span, object.send(attribute_name), class: 'uneditable-input')
  end
end

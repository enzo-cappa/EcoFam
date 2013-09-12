class ReadOnlyInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:span, object.send(attribute_name), class: 'uneditable-input')
  end
end

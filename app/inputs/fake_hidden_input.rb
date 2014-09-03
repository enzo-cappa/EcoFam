class FakeHiddenInput < SimpleForm::Inputs::Base
  disable :errors, :hint, :required
  
  # This method only create a basic input without reading any value from object
  def input(wrapper_options)
    template.hidden_field(attribute_name, nil, input_html_options)
  end

  def label(wrapper_options)
    template.label(attribute_name, nil, {class: 'col-sm-2 control-label'})
  end
end

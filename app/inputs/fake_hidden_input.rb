class FakeHiddenInput < SimpleForm::Inputs::Base
  disable :label, :errors, :hint, :required
  
  # This method only create a basic input without reading any value from object
  def input
    template.hidden_field(attribute_name, nil, input_html_options)
  end
end

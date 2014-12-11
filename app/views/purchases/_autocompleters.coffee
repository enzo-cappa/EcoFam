productsSource = new Bloodhound
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: $.map(<%= raw @products.to_json %>,
    (tag) ->
      { value: tag })

productsSource.initialize()

opts =
  hint: true,
  highlight: true,
  minLength: 1

productDataSet =
  name: 'values',
  displayKey: 'value',
  source: productsSource.ttAdapter()

brandsSource = new Bloodhound
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: $.map(<%= raw @brands.to_json %>,
    (tag) ->
      { value: tag })

brandsSource.initialize()

brandDataSet =
  name: 'values',
  displayKey: 'value',
  source: brandsSource.ttAdapter()

$('input[data-provide=product-typeahead]').typeahead(opts, productDataSet)
$(document).on('nested:fieldAdded', (event) ->
  field = event.field
  productField = field.find("input[id$='product_attributes_name']")
  productField.typeahead(opts, productDataSet))

$('input[data-provide=brand-typeahead]').typeahead(opts, brandDataSet)
$(document).on('nested:fieldAdded', (event) ->
  field = event.field
  brandField = field.find("input[id$='brand_attributes_name']")
  brandField.typeahead(opts, brandDataSet))

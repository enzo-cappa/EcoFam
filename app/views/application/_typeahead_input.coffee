values = new Bloodhound
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: $.map(<%= raw values.to_json %>,
    (tag) ->
      { value: tag })

values.initialize()

$("<%= dom_selector %>").typeahead(
    hint: true,
    highlight: true,
    minLength: 1
  ,
    name: 'values',
    displayKey: 'value',
    source: values.ttAdapter()
)

extractDayNum = (row) ->
  $(row).find('td:first').text().match(/\d{2}/)[0]
  .match(/\d{2}/)[0]
  
window.spendsSorter = (rowA, rowB) ->
  extractDayNum(rowA) > extractDayNum(rowB)



extractDayNum = (row) ->
  $(row).find('td:first').text().match(/\d{2}/)[0]
  .match(/\d{2}/)[0]
  
window.spendsSorter = (rowA, rowB) ->
  extractDayNum(rowA) > extractDayNum(rowB)

window.updateNav = (entityName) -> 
  $('ul.nav li.active').removeClass('active')
  $('li:has(a#' + entityName + '-list-item)').addClass("active")

closeAlerts = () ->
  $(".alert").alert('close')
window.setTimeout(closeAlerts, 4000)

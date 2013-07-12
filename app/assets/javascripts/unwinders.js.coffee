$ ->
  $('.chzn-select').chosen
    no_results_text: 'No results matched'
    default_multiple_text: 'Select Destinations'
    width: '220px'

$(".assign-vc").on "click", ->
  $('#my-modal').modal 'show'
  $('#my-modal').modal({keyboard: true})

$("#cust-request a").on "click", ->
  $('#my-vc-modal').modal 'show'
  $('#my-vc-modal').modal({keyboard: true})

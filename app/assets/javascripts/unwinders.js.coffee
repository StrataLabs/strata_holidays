$ ->
  $('.chzn-select').chosen
    no_results_text: 'No results matched'
    default_multiple_text: 'Select Destinations'
    width: '220px'

$(".assign-vc").on "click", ->
  $('#my-modal').modal 'show'
  $('#my-modal').modal({keyboard: true})

$('#comment-section').on "click", ->
  $('#comment-modal').modal 'show'

$("#cust-request a").on "click", ->
  $('#my-vc-modal').modal 'show'
  $('#my-vc-modal').modal({keyboard: true})

$("#cust_iti_request_submit").on "click", ->
  ok = true
  $(":text, :checkbox, select, textarea, number").each ->
    unless $(this).attr("value") is 'Select Destinations'
      if $(this).val() == ""
        $(this).attr "style", "border-color:#FF0000;"
        ok = false
  if $(".chzn-select").chosen().val() is null
    ok = false
    alert "Please Select Destinations"
  $(this).parents("form").submit()  if ok
  false

$(document).ready ->
  $("#cust_iti_request_start_date").datepicker
    dateFormat: "dd MM yy"
    minDate: 1
  $("#cust_iti_request_end_date").datepicker
    dateFormat: "dd MM yy"
    minDate: 1
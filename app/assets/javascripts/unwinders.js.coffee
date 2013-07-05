$ ->
  $('.chzn-select').chosen
    no_results_text: 'No results matched'
    default_multiple_text: 'Select Destinations'
    width: '220px'

$(".assign-vc").on "click", ->
  console.log "am getting called"
  $(".search-vcs").fadeToggle()
  false

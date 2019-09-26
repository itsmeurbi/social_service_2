$(document).on('turbolinks:load', function () {
  $('#discarded').hide()

  $('#print-btn').on('click', function() {
    setTimeout(() => window.location.reload(), 3000)
  })
})

function showDiscarded() {
  $('#discarded').show()
}

function hideDiscarded() {
  $('#discarded').hide()
}

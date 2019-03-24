$(document).on('turbolinks:load', function() {
  $('#editorial_editorial_id').on('change', function() {
    var editorial_id = $(this).val();
    $.ajax({
      url: '/editorial_levels',
      method: 'GET',
      data: { editorial_id: editorial_id }
    });
  });

  $('body').on('change', '#level_level_id', function() {
    var level_id = $(this).val();
    $.ajax({
      url: '/level_units',
      method: 'GET',
      data: { level_id: level_id }
    });
  });
});

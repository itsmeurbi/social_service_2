$(document).on('turbolinks:load', function() {
  $('#exam_level_id').on('change', function() {
    var level_id = $(this).val();
    $.ajax({
      url: '/exam_unit_questions',
      method: 'GET',
      data: { level_id: level_id }
    });
  });
});

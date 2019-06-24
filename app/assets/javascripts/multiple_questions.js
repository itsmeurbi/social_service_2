$(document).on('turbolinks:load', function() {
  if ($('div.questions-container')) {
    disableLevelUnitDropdown();
  }
  $('#editorial_editorial_id').on('change', function() {
    var compreh_quest = $('#compreh_quest').val() || null;
    var editorial_id = $(this).val();
    $.ajax({
      url: '/editorial_levels',
      method: 'GET',
      data: { editorial_id: editorial_id, compreh_quest: compreh_quest },
      success: disableLevelUnitDropdown()
    });
  });

  $('body').on('change', '#level_level_id', function() {
    var level_id = $(this).val();
    var compreh_quest = $('#compreh_quest').val() || null;
    var editorial_id = $('#editorial_editorial_id').val();
    $.ajax({
      url: '/level_units',
      method: 'GET',
      data: {
        level_id: level_id,
        editorial_id: editorial_id,
        compreh_quest: compreh_quest
      },
      success: disableUnitDropdown()
    });
  });

  $('body').on(
    'change',
    'div.level-units-dropdown-container select',
    function() {
      var unit_id = $(this).val();
      var level_id = $('#level_level_id').val();
      var compreh_quest = $('#compreh_quest').val() || null;
      $.ajax({
        url: '/unit_questions',
        method: 'GET',
        data: {
          unit_id: unit_id,
          level_id: level_id,
          compreh_quest: compreh_quest
        }
      });
    }
  );
});

function disableLevelUnitDropdown() {
  $('#multiple_question_unit').prop('disabled', true);
  $('#unit_unit_id').prop('disabled', true);
  $('#comprehension_question_unit').prop('disabled', true);
  var value = $('#editorial_editorial_id').val();
  if (value === '') {
    $('#level_level_id').prop('disabled', true);
  }
}

function disableUnitDropdown() {
  var value = $('#level_level_id').val();
  if (value === '') {
    $('#multiple_question_unit').prop('disabled', true);
    $('#unit_unit_id').prop('disabled', true);
  }
}

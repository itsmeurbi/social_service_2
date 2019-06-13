$(document).on('turbolinks:load', function() {
  $('div.lecture-section > div').hide();
  $('div.choose-type-of-file > div.file').on('click', function() {
    $('div.choose-type-of-file > div.text').hide();
    $('div.file-section').show();
    $('div.lecture-section > div.back').show();
  });

  $('div.choose-type-of-file > div.text').on('click', function() {
    $('div.choose-type-of-file > div.file').hide();
    $('div.texteditor-section').show();
    $('div.lecture-section > div.back').show();
  });

  $('div.lecture-section > div.back').on('click', function() {
    $('div.lecture-section > div').hide();
    $('div.choose-type-of-file > div').show();
  });
});

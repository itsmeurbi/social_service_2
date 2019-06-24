$(document).on('turbolinks:load', function() {
  $('div.lecture-section > div.file-section').hide();
  $('div.choose-type-of-file > div.text').hide();

  $('div.choose-type-of-file > div.file').on('click', function() {
    $('div.choose-type-of-file > div.file').hide();
    $('div.choose-type-of-file > div.text').show();
    $('div.file-section').show();
    $('div.texteditor-section').hide();
  });

  $('div.choose-type-of-file > div.text').on('click', function() {
    $('div.choose-type-of-file > div.file').show();
    $('div.choose-type-of-file > div.text').hide();
    $('div.file-section').hide();
    $('div.texteditor-section').show();
  });
});

$(function(){
  $('.edit_job input[type=submit]').remove();
  $('.edit_job input[type=radio]').click(function(){
    $(this).parent('form').submit();
  });
});

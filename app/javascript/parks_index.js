$(function() {
  $('.parks_list').click(function() {
    var $park = $(this).find('.park');
    if($park.hasClass('open')) {
      $park.removeClass('open');
      $park.slideUp();
      $(this).find('span').text('+');
    } else {
      $park.addClass('open');
      $park.slideDown();
      $(this).find('span').text('-');
    }
  });
});
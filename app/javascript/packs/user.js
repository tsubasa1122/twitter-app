$(function(){
  $('.js-modal-open').on('click', function(){
    $('.js-modal').fadeIn();
    return
  });
  $('.js-modal-close').on('click', function(){
    $('.js-modal').fadeOut();
    return false;
  });
});

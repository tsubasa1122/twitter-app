$(function(){
  $('.tweet-modal-open').on('click', function(){
    $('.tweet-js-modal').fadeIn();
  });
  $('.tweet-modal-close').on('click', function(){
    $('.tweet-js-modal').fadeOut();
  });

  $('.modal-close-button').on('click', function(){
    $('.tweet-js-modal').fadeOut();
  })
});

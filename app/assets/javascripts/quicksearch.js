$(document).ready(function(){
  $('input#search').quicksearch('.profile', {
    'onAfter': function () {
      var count = $('.profile').filter(":visible").length;
      var text = count + ' matching profiles.'
      $('#search_count').html(text);
    }
  });
  
});
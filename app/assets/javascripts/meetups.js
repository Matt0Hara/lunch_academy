$(document).ready(function() {
  $("nav.pagination").hide();
  var page = 2;
  $(window).scroll(function() {
    var ratio = $(document).height()/$(document).width();
    pageHeight = 0
    if (ratio > 1) {
      pageHeight = $(document).height() - 600;
    }
    else {
        pageHeight = $(document).height() - 10;
      }
    var position = $(window).scrollTop() + $(window).height();
    if(position > pageHeight) {
      var link = $(".pagination a:contains(" + page + ")");
      link.click();
      page++;
    }
  });
});

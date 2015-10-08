$(document).ready(function() {
  $("nav.pagination").hide();
  var page = 2;
  $(window).scroll(function() {
    ratio = $(document).height()/$(document).width();
    if (ratio > 1) {
      var pageHeight = $(document).height() - 600;
    }
    else {
        var pageHeight = $(document).height() - 10;
      };
    var position = $(window).scrollTop() + $(window).height();
    if(position > pageHeight) {
      var link = $(".pagination a:contains(" + page + ")");
      link.click();
      page++;
    };
  });
});

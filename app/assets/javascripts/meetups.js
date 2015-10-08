$(document).ready(function() {
  $("nav.pagination").hide();
  page = 2;
  $(window).scroll(function() {
    ratio = $(document).height()/$(document).width();
    subtraction = 0;
    if (ratio > 1) {
      pageHeight = $(document).height() - 600;
    }
    else {
        pageHeight = $(document).height() - 10;
      };
    position = $(window).scrollTop() + $(window).height();
    if(position > pageHeight) {
      link = $(".pagination a:contains(" + page + ")");
      link.click();
      page++;
    };
  });
});

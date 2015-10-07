$(document).ready(function() {
  $("nav.pagination").hide();
  page = 2;
  $(window).scroll(function() {
    pageHeight = $(document).height() - 10;
    position = $(window).scrollTop() + $(window).height();
  if(position > pageHeight) {
    link = $(".pagination a:contains(" + page + ")");
    link.click();
    page++;
  };
});

});

$(document).ready(function() {
  $("nav.pagination").hide();
  var page = 2;
  $(window).scroll(function() {
    // var lastDivPos = $(".meetup").last().position()["top"] - $(".meetup").last().height()
    var ratio = $(document).height()/$(document).width();
    var pageHeight = 0
    if (ratio > 1) {
      pageHeight = $(document).height() - 310;
    }
    else {
        pageHeight = $(document).height() - 310;
      }
    var position = $(window).scrollTop() + $(window).height();
    if(position > pageHeight) {
      var link = $(".pagination a:contains(" + page + ")");
      link.click();
      page++;
    }
  });



  $.zoomooz.setup({nativeanimation:true, debug:false});

  //   $(".cover").click(function(evt) {
  //   evt.stopPropagation();
  //   this.fadeTo()
  // });

  // $(".box").click(function(evt) {
  //   evt.stopPropagation();
  //   $(this).zoomTo({targetsize:0.7});
  // });



  $(".face").click(function(evt) {
    if(evt.toElement.className != "f2Link") {
      $("body")
      evt.stopPropagation();
      // $(".cover").hide();
      $(this).zoomTo();
      $(this).children(".thaCover").hide()
    }
  });

  $(window).click(function(evt) {
    evt.stopPropagation();
    $("body").zoomTo({targetsize:1.0});
    $(".thaCover").show();
  });

  // for iPhone
  // $("#cubeContainer").click(function(evt) {
  //   if(evt.toElement.className != "f2Link") {
  //     evt.stopPropagation();
  //     $("body").zoomTo({targetsize:1.0});
  //     $(".cover").show();
  //   }
  // });

  $("body").zoomTo({targetsize:1.0});
  // $(".thaCover").show();
});

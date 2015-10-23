$(document).ready(function() {
  $(".commentDelete").click(function(event) {
    event.preventDefault();
    var meetup = this.parentElement.parentElement.parentElement.parentElement;
    var meetupId = meetup.id;
    var commentId = this.parentElement.id.replace("comment","");
    $.ajax({
      url: "/meetups/" + meetupId + "/comments/" + commentId,
      method: "POST",
      datatype: "JSON",
      data: { _method:"DELETE", meetup_id: meetupId },
      success: function() {
        $("#comment" + commentId).remove();
      }
    }
    )
  })
})

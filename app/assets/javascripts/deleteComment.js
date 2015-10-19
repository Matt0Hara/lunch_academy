$(document).ready(function() {
  $('.commentDelete').click(function(event) {
    event.preventDefault();
    var meetup = this.parentElement.parentElement.parentElement.parentElement
    var meetup_id = meetup.id
    commentId = this.parentElement.id.replace("comment","")
    $.ajax({
      url: "/meetups/" + meetup_id + "/comments/" + commentId,
      method: "POST",
      datatype: "JSON",
      data: { _method:"DELETE", meetup_id: meetup_id },
      success: function(data) {
        $("#comment" + commentId).remove();
      }
    }
    )
  })
})

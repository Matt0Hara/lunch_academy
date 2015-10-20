// handle adding a comment
$(document).ready(function() {
  $('.commentForm form').submit(function(event) {
    event.preventDefault();
    var meetup_id = this.parentElement.parentElement.parentElement.id
    var body = this.children[2].value
    this.children[2].value = ""
    $.ajax({
      url: "/meetups/" + meetup_id + "/comments",
      method: "POST",
      datatype: "JSON",
      data: { meetup_id: meetup_id, body: body },
      success: function(data) {
      $("#" + meetup_id + " .comments").prepend(data);

      var thing = $("#" + meetup_id + " .comments").children().first();
      // fix this
      thing.click(function(event) {
        event.preventDefault();
        var meetup = this.parentElement.parentElement.parentElement
        var meetup_id = meetup.id
        commentId = this.id.replace("comment","")
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
      }
    }
    )
  })
})

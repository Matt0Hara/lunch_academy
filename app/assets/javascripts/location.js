// $(document).ready(function() {
//
// final = [];
// // var geocoder = new google.maps.Geocoder();
// function geocodeAddress(geocoder, address, meetupId) {
//
//   geocoder.geocode({'address': address}, function(results, status) {
//     if (status === google.maps.GeocoderStatus.OK) {
//       final = results[0];
//     } else {
//       alert('Geocode was not successful for the following reason: ' + status);
//     }
//   });
//   debugger;
// }
// $(".locationForm form").submit(function(event) {
//   event.preventDefault();
//   var body = this.children[2].value;
//   meetupId = this.parentElement.parentElement.parentElement.id;
//   var success = [];
//   success = geocodeAddress(geocoder, body, meetupId);
//
//   $.ajax({
//     method: "POST",
//     url: "/meetups/" + meetupId + "/locations",
//     datatype: "JSON",
//     data: { address: final.formatted_address, meetup_id: meetupId, bigJ: final},
//     success: function(data) {
//       debugger;
//     }
//   })
// })
//
// })

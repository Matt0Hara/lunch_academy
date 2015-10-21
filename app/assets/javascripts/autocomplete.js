// Create the autocomplete helper, and associate it with
 // an HTML text input box.

  var autocomplete;
              function initialize() {
                autocomplete = new google.maps.places.Autocomplete(
                    /** @type {HTMLInputElement} */(document.getElementById('location_address')),
                    { types: ['geocode'] });
                google.maps.event.addListener(autocomplete, 'place_changed', function() {
                });
              }

   $("#location_address").focus(function() {
     geolocate("food");
   })
  // var marker = new google.maps.Marker({
  //   map: map
  // });
  // google.maps.event.addListener(marker, 'click', function() {
  //   infowindow.open(map, marker);
  // });

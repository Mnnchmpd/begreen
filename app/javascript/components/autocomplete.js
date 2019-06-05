function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var JourneyAddress = document.getElementById('journey_address');

    if (journeyAddress) {
      var autocomplete = new google.maps.places.Autocomplete(journeyAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(journeyAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

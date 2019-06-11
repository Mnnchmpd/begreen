import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('journey_starting_point');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInput2 = document.getElementById('journey_ending_point');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete };

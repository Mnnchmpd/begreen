import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.autocomplete-form #journey_starting_point');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInput2 = document.querySelector('.autocomplete-form #journey_ending_point');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export default initAutocomplete;

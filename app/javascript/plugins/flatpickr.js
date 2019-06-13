import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!
import "flatpickr/dist/themes/material_green.css";

const initFlatpickr = () => {
  const datepicker = document.querySelector('.datepicker');
  if (datepicker) {
    flatpickr(".datepicker");
  }
}

export default initFlatpickr;

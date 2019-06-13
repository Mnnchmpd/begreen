import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

const initSelect2 = () => {
  const select = document.querySelector('.select2');
  if (select) {
    $('.select2').select2({
      placeholder: 'Choose your travel mode',
      minimumResultsForSearch: Infinity
    }); // (~ document.querySelectorAll)
  }
};

export default initSelect2;

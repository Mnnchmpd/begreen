import "bootstrap";
import $ from 'jquery';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete'
import Chart from 'chart.js';

  var ctxL = document.getElementById("lineChart")

if (ctxL) {
  ctxL .getContext('2d');
  var myLineChart = new Chart(ctxL, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
      datasets: [{
          label: "Mes empreintes carbonnes",
          data: [65, 59, 80, 81, 56, 55, 40],
          backgroundColor: [
            'rgba(105, 0, 132, .2)',
          ],
          borderColor: [
            'rgba(200, 99, 132, .7)',
          ],
          borderWidth: 2
        },
      ]
    },
    options: {
      responsive: true
    }
  });
}



import { initChart } from '../plugins/init_chartjs';

initChart();

initMapbox();
initAutocomplete();


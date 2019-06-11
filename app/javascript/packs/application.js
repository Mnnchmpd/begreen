import "bootstrap";
import $ from 'jquery';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initChart } from '../plugins/init_chartjs';

initChart();
initMapbox();


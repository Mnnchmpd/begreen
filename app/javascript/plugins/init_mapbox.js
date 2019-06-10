import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat])
      .addTo(map);
    })

    fitMapToMarkers(map, markers);
    const steps = JSON.parse(mapElement.dataset.steps);
    setTimeout(() => {
      itineraire(map, steps);
    }, 1200)
  };
};

const itineraire = (map, steps) => {
 // check if the route is already loaded
//  const currentLocationControl = document.querySelector('.mapboxgl-ctrl-geolocate');

// console.log(currentLocationControl).
// console.log(currentLocationControl);
  console.log(map.getSource('route'));
  // const allSteps = steps.routes[0].geometry.coordinates;
  if (map.getSource('route')) {
    map.removeLayer('route')
    map.removeSource('route')
  } else {
    console.log(steps)
    map.addLayer({
      "id": "route",
      "type": "line",
      "source": {
        "type": "geojson",
        "data": {
          "type": "Feature",
          "geometry": {
            "type": "LineString",
            "coordinates": steps
          },
          "properties": {},
        }
      },
      "layout": {
        "line-join": "round",
        "line-cap": "round"
      },
      "paint": {
        "line-color": "#3b9ddd",
        "line-width": 8,
        "line-opacity": 0.8
      }
    });
  };
};


export { initMapbox };


import Chart from 'chart.js';

const initChart = () => {
  const ctxL = document.getElementById("lineChart");

  if (ctxL) {
    ctxL .getContext('4d');
    var myLineChart = new Chart(ctxL, {
      type: 'line',
      data: {
        labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        datasets: [{
            label: "Mes empreintes carbonnes",
            data: [65, 59, 80, 81, 56, 55, 40, 20, 30, 91, 18],
            backgroundColor: [
              'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: [
              'rgba(75, 192, 192, 1)',
            ],
            borderWidth: 0
          },
        ]
      },
      options: {
        responsive: true
      }
    });
  }
}

export { initChart };

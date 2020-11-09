
var ctxP = document.getElementById("labelChart").getContext('2d');
var myPieChart = new Chart(ctxP, {

  type: 'pie',
  data: {
    labels: ["Yes", "No"],
    datasets: [{
      data: [97.6,2.4],
      backgroundColor: ["#3bbbe2", "#ef3930"],
      hoverBackgroundColor: ["#4ec1e4", "#f04c44"]
    }]
  },
  options: {
    responsive: true,
    legend: {
      position: 'right',
      labels: {
        padding: 20,
        boxWidth: 10
      }
    },
    animation:{
      duration: 2000,
      easing:'easeOutBounce'
    }
  }
});

var ctxP = document.getElementById("labelChart2").getContext('2d');
var myPieChart = new Chart(ctxP, {

  type: 'pie',
  data: {
    labels: ["Yes", "No"],
    datasets: [{
      data: [50.4,49.6],
      backgroundColor: ["#3bbbe2", "#ef3930"],
      hoverBackgroundColor: ["#4ec1e4", "#f04c44"]
    }]
  },
  options: {
    responsive: true,
    legend: {
      position: 'right',
      labels: {
        padding: 20,
        boxWidth: 10
      }
    },
    animation:{
      duration: 2000,
      easing:'easeOutBounce'
    }
  }});

new Chart(document.getElementById("horizontalBar"), {
  type: "horizontalBar",
  data: {
    labels: ["Red"],
      datasets: [{
        label: "Yes",
        data: [51],
        fill: false,
        backgroundColor: ["rgba(255, 99, 132, 0.2)"],
        borderColor: ["rgb(255, 99, 132)"],
        borderWidth: 1
      }]
    },
    options: {
    scales: {
      xAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});
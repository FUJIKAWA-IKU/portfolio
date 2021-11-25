var ctx = document.getElementById("myChart_bar_distance");
var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"],
    datasets: 
    [
      {
      label: 'ランニング走行距離',
      spanGaps: true,
      backgroundColor: 'rgba(102,255,129,0.2)',
      borderColor: 'rgba(122,255,129,0.2)',
      data: gon.weekly_records_distance
      }
    ]
  },
  options: {
    scales: {
      yAxes: [
        {
          scaleLabel: {
              display: true,
              labelString: '走行距離(km)',
              fontSize: 15
          },
          ticks: {        
            suggestedMin: 0,
            suggestedMax: 10,
            fontSize: 15
          }
        }
      ]
    },
    legend: {
      display: false
   }
  }
});

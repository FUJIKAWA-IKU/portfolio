var ctx = document.getElementById("myChart_bar_time");
var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"],
    datasets: 
    [
      {
        label: 'ランニング',
        spanGaps: true,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        data: gon.weekly_records_time,
      },
      {
        label: '足',
        spanGaps: true,
        backgroundColor: 'rgba(255, 159, 64, 0.2)',
        borderColor: 'rgba(255, 159, 64, 1)',
        data: gon.weekly_trainings_asi,
      },
      {
        label: '背中',
        spanGaps: true,
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1)',
        data: gon.weekly_trainings_se,
      },
      {
        label: '腕',
        spanGaps: true,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        data: gon.weekly_trainings_ude,
      },
      {
        label: 'お尻',
        spanGaps: true,
        backgroundColor: 'rgba(153, 102, 255, 0.2)',
        borderColor: 'rgba(153, 102, 255, 1)',
        data: gon.weekly_trainings_oshiri,
      },
      {
        label: '胸',
        spanGaps: true,
        backgroundColor: 'rgba(219, 39, 91, 0.2)',
        borderColor: 'rgba(219, 39, 91, 1)',
        data: gon.weekly_trainings_mune,
      }
    ]
  },
  options: {
    scales: {
      xAxes: [{
        stacked: true
      }],
      yAxes: [{
        scaleLabel: {
          display: true,
          labelString: '時間(分)',
          fontSize: 15
        },
        stacked: true,
        ticks: {
          min: 0,
          fontSize: 15
        }
      }]
    }
  }
});

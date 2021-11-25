var ctx = document.getElementById("myChart_pie_training");
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["ランニング", "足", "背中", "腕", "お尻", "胸"],
    datasets: 
    [
      {
        spanGaps: true,
        backgroundColor: [
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(219, 39, 91, 0.2)'
        ],
        borderColor: [
          'rgba(54, 162, 235, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(219, 39, 91, 1)'
        ],
        data: [
          gon.weekly_records_time_sum,
          gon.weekly_trainings_asi_sum,
          gon.weekly_trainings_senaka_sum,
          gon.weekly_trainings_ude_sum,
          gon.weekly_trainings_oshiri_sum,
          gon.weekly_trainings_mune_sum
        ]
      }
    ]
  }
});

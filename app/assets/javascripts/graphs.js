$(document).on("turbolinks:load", () => {
  Chart.defaults.global.plugins = {
    datalabels: {
      color: "black",
      font: {
        size: 14,
        weight: "bold",
        family: '"Lucida Console", Monaco, monospace',
      },
      align: "end",
      anchor: "end",
    },
  }
  Chart.defaults.global.maintainAspectRatio = true
  Chart.defaults.global.responsive = true
  Chart.defaults.global.defaultColor = "#45AA77"
  Chart.defaults.global.tooltips.enabled = false
  Chart.defaults.global.title.display = true
  Chart.defaults.global.legend.display = false
  Chart.plugins.register(ChartDataLabels)

  const weekEl = document.getElementById("week-graph");
  const weekData = JSON.parse(
    weekEl.dataset["graph"]
  );

  const monthEl = document.getElementById("month-graph");
  const monthData = JSON.parse(
    monthEl.dataset["graph"]
  );

  const yearEl = document.getElementById("annual-graph");
  const yearData = JSON.parse(
    yearEl.dataset["graph"]
  );

  const charts = [
    new Chart(weekEl.getContext("2d"), {
      type: "bar",
      data: {
        labels: weekData.map((d) => d.label),
        datasets: [
          {
            backgroundColor: "#45AA77",
            label: "Rendimentos",
            data: weekData.map((d) => d.value),
          },
        ],
      },
      options: {
        title: {
          text: "Rendimento em intervalos semanais",
        },
        scales: {
          yAxes: [
            {
              ticks: {
                suggestedMin: 0,
                suggestedMax: 1000,
                stepSize: 100,
                beginAtZero: true,
              },
              scaleLabel: {
                display: true,
                labelString: "Valor em R$",
              },
            },
          ],
        },
      },
    }),

    new Chart(monthEl.getContext("2d"), {
      type: "bar",
      data: {
        labels: monthData.map((d) => d.label),
        datasets: [
          {
            backgroundColor: "#45AA77",
            label: "Rendimentos",
            data: monthData.map((d) => d.value),
          },
        ],
      },
      options: {
        title: {
          text: "Rendimento em intervalos mensais",
        },
        scales: {
          yAxes: [
            {
              ticks: {
                suggestedMin: 0,
                suggestedMax: 1000,
                stepSize: 100,
                beginAtZero: true,
              },
              scaleLabel: {
                display: true,
                labelString: "Valor em R$",
              },
            },
          ],
        },
      },
    }),

    new Chart(yearEl.getContext("2d"), {
      type: "bar",
      data: {
        labels: yearData.map((d) => d.label),
        datasets: [
          {
            backgroundColor: "#45AA77",
            label: "Rendimentos",
            data: yearData.map((d) => d.value),
          },
        ],
      },
      options: {
        title: {
          text: "Rendimento por ano",
        },
        scales: {
          yAxes: [
            {
              ticks: {
                suggestedMin: 0,
                suggestedMax: 10000,
                stepSize: 1000,
                beginAtZero: true,
              },
              scaleLabel: {
                display: true,
                labelString: "Valor em R$",
              },
            },
          ],
        },
      },
    }),
  ];

  const dailyEl = $('#daily-data')
  const dailyData = dailyEl.data('values')
  const dailyPicker = dailyEl.datepicker({
    startDate: dailyEl.data('start'),
    endDate: dailyEl.data('end'),
    defaultViewDate: 'today',
    maxViewMode: 1,
    language: "pt-BR",
    todayHighlight: true
  })

  const today = new Date()
  today.setHours(0,0,0,0)

  dailyPicker.on('changeDate', function(e){ showValueForDay(e.date) })

  dailyPicker.datepicker('setDate', today)

  function showValueForDay(day){
    if (!(day instanceof Date)){ return }

    $('#selected-day').text(locale(day))
    $('#value').text(dailyData[toKey(day)] || 0)
  }

  function locale(date){
    if (!(date instanceof Date)){ return 'Inválido.'}

    return date.toLocaleDateString('pt-BR')
  }

  function getValueAndShow() {
    const value = parseInt(this.value);

    show(value);
  }

  const graphSelect = $("#graph-interval-select");

  graphSelect.on('change', getValueAndShow)

  graphSelect.trigger("change");

  function hideAll() {
    $("div[data-select]").addClass('visuallyhidden');
  }

  function show(identifier) {
    hideAll();
    $(`div[data-select="${identifier}`).removeClass('visuallyhidden');
  }

  function getCurrentVisibleIndex() {
    return parseInt(getCurrentVisible()[0].dataset["select"]);
  }

  function getCurrentVisible() {
    return $("div[data-select]:not(.visuallyhidden)");
  }

  function toKey(date){ 
    return `${date.getFullYear()}${(date.getMonth() + 1).toString().padStart(2, '0')}${date.getDate().toString().padStart(2, '0')}` 
  }

  window.addEventListener("optimizedResize", function () {
    if (window.innerWidth <= 768 && Chart.defaults.global.maintainAspectRatio){
      Chart.defaults.global.maintainAspectRatio = false;
    }
    else {
      if (!Chart.defaults.global.maintainAspectRatio)
        Chart.defaults.global.maintainAspectRatio = true
    }

    for (const chart of charts){
      chart.options.maintainAspectRatio = Chart.defaults.global.maintainAspectRatio;
      chart.update()
    }
  });
});

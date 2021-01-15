$(document).on('turbolinks:load', () => {
  const graphs = [
    Morris.Line({
      element: 'week-graph',
      data: $('#week-graph').data('graph'),
      xkey: 'created_at',
      ykeys: ['collected'],
      labels: ['Quantia Recebida (R$)'],
      lineColors: ['#45AA77']
    }),

    Morris.Line({
      element: 'month-graph',
      data: $('#month-graph').data('graph'),
      xkey: 'created_at',
      ykeys: ['collected'],
      labels: ['Quantia Recebida (R$)'],
      lineColors: ['#45AA77']
    }),

    Morris.Line({
      element: 'annual-graph',
      data: $('#annual-graph').data('graph'),
      xkey: 'created_at',
      ykeys: ['collected'],
      labels: ['Quantia Recebida (R$)'],
      lineColors: ['#45AA77']
    })
  ]

  function getValueAndShow() {
    const value = parseInt(this.value)

    show(value, () => {
      graphs[value].redraw()
    })
  }

  const graphSelect = $('#graph-interval-select')

  graphSelect.on('change', getValueAndShow)

  graphSelect.trigger('change')

  function hideAll() {
    $('div[data-select]').hide()
  }

  function show(identifier, callback) {
    hideAll()
    $(`div[data-select="${identifier}`).show(callback)
  }

  function getCurrentVisibleIndex() {
    return parseInt(getCurrentVisible()[0].dataset['select'])
  }

  function getCurrentVisible() {
    return $('div[data-select]:visible')
  }

  window.addEventListener('optimizedResize', function () {
    graphs[getCurrentVisibleIndex()].redraw()
  })
})

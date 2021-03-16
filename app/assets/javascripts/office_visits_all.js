
$(document).on('turbolinks:load', () => {
  const tableId = '#all-office-visits-table'
  const events = []

  const table = $(tableId).DataTable({
    retrieve: true,
    autoWidth: false,
    dom: 'tp',
    language: {
      url: "//cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json"
    },
    paging: true,
    fixedColumns: false,
    columns: [
      {
        searchable: true,
        title: 'Data',
        orderable: true,
        width: null,
        responsivePriority: 1
      },
      {
        searchable: true,
        title: 'Paciente',
        orderable: true,
        width: null,
        responsivePriority: 2
      },
    ],
    responsive: true
  })


  const search = $('#all-office-visits-search')

  search.on('keyup', function () {
    table.search(this.value).draw()
  })

  const visits = $(tableId).data('visits')

  for (const visit of visits) {
    events.push(calendar.addEvent({
      id: visit.id,
      title: `${visit.patient_name} - Horário: ${visit.hour}`,
      start: visit.date + 'T' + visit.hour + ':00',
      allDay: false,
    }))
  }

  window.visits = visits
  window.events = events
})

$(document).on('click', '#all-office-visits-table tr', function(e){
  const l = this.dataset['link'] ? this.dataset['link'] : ''
  window.location.href = l
})

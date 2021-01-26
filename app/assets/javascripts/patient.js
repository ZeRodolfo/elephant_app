$(document).on('turbolinks:load', () => {
  const tableId = '#patients-table'
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
        title: 'Nome',
        orderable: true,
        width: null,
        responsivePriority: 1
      },
      {
        searchable: true,
        title: 'Contato',
        orderable: true,
        width: null,
        responsivePriority: 2
      },
      {
        searchable: true,
        title: 'Profissão',
        orderable: true,
        width: null,
        responsivePriority: 3
      },
      {
        searchable: true,
        title: 'Idade',
        orderable: true,
        width: null,
        responsivePriority: 4
      },
      {
        searchable: true,
        title: 'Gen.',
        orderable: true,
        width: null,
        responsivePriority: 5
      }
    ],
    responsive: true
  })

  const search = $('#patient-search')

  search.on('keyup', function () {
    table.search(this.value).draw()
  })
})

$(document).on('click', '#patients-table tr', function(e){
  const l = this.dataset['link'] ? this.dataset['link'] : ''
  window.location.href = l
})
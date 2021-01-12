
$(document).on('turbolinks:load', () => {
    const tableId = '#office-visits-table'
    let table = null

    // turbolinks workaround
    if ($.fn.dataTable.isDataTable(tableId)) {
        table = $(tableId).DataTable()
    }
    else {
        table = $(tableId).DataTable({
            autoWidth: false,
            dom: 't',
            language: {
                url: "//cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json"
            },
            paging: false,
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
                    title: 'Descrição',
                    orderable: true,
                    width: null,
                    responsivePriority: 2
                },
                {
                    searchable: false,
                    title: 'Atalhos',
                    orderable: false,
                    width: '20%',
                    responsivePriority: 1
                }
            ],
            responsive: true
        })
    }

    const search = $('#office-visits-search')

    search.on('keyup', function () {
        table.search(this.value).draw()
    })
})
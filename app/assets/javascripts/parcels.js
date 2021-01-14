$(() => {
    $('[data-toggle="tooltip"]').tooltip()

    const tableId = '#parcels-table'

    const table = $(tableId).DataTable({
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
                title: 'Valor',
                orderable: true,
                width: null,
                responsivePriority: 1
            },
            {
                searchable: true,
                title: 'Data',
                orderable: true,
                width: null,
                responsivePriority: 1
            },
            {
                searchable: true,
                title: 'Observação',
                orderable: true,
                width: null,
                responsivePriority: 2
            },
            {
                searchable: false,
                title: 'Atalhos',
                orderable: false,
                width: null,
                responsivePriority: 1
            }
        ],
        responsive: true
    })
})

$(() => {
    const tableId = '#all-office-visits-table'
    const events = []

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
            {
                searchable: false,
                title: 'Atalhos',
                orderable: false,
                responsivePriority: 1
            }
        ],
        responsive: true
    })
    

    const search = $('#all-office-visits-search')

    search.on('keyup', function () {
        table.search(this.value).draw()
    })

    const visits = $(tableId).data('visits')

    for (const visit of visits){
        events.push(calendar.addEvent({
            id: visit.id,
            title: `${visit.patient_name} - Horário: ${visit.hour}`,
            start: visit.date + 'T' + visit.hour + ':00',
            // end: visit.date,
            allDay: false,
            // endTime: visit.hour
        }))
    }

    window.visits = visits
    window.events = events
})
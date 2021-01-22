$(() => {
  const types = [
    "atestado",
    "adulto",
    "infantil",
    "declaracao",
    "laudo",
    "parecer",
    "relatorio",
  ]

  for (const id of types) {
    const tableIdentifier = `#${id}-table`;
    if ($(tableIdentifier).length) {
      $(tableIdentifier).DataTable({
        retrieve: true,
        autoWidth: false,
        dom: "tp",
        language: {
          url:
            "//cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json",
        },
        paging: true,
        fixedColumns: false,
        columnDefs: [
          {
            targets: -1,
            searchable: false,
            title: "Atalhos",
            orderable: false,
            width: "25%",
            responsivePriority: 1,
          },
        ],
        responsive: true,
      })
    }
  }
})

$(document).on('turbolinks:load', () => {
  const tableId = '#office-visits-table'

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
    responsive: true,
    order: []
  })


  const search = $('#office-visits-search')

  search.on('keyup', function () {
    table.search(this.value).draw()
  })

  $("#baixar_tudo_click").click(function(e) {
    e.preventDefault();

    $('#baixa_alert').show();
  })

  $("#baixa_alert_cancel").click(function(e) {
    e.preventDefault()
    $('#baixa_alert').hide();
  })

  // $("#default_office_visit_value").change(function(e) {
  //   const default_office_visit_value = parseFloat($(this).val())
  //   const url = $(this).data('url');
  //   const id = $(this).data('id');

  //   if (!isNaN(default_office_visit_value)) {
  //     $.ajax({
  //       url,
  //       type: 'patch',
  //       data: {
  //         id,
  //         patient: {
  //           default_office_visit_value
  //         }
  //       },
  //       success: function(response) {
  //         console.log(response)
  //       },
  //       error: function(err) {
  //         alert("Não foi possível atualizar o valor default da consulta.")
  //       }
  //     })
  //   }
  // })
})

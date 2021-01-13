
$(() => {
  const tableId = '#patients-table'
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
      },
      {
        searchable: false,
        title: 'Atalhos',
        orderable: false,
        width: '10%',
        responsivePriority: 1
      }
    ],
    responsive: true
  })


  window.addEventListener('optimizedResize', function (e) {
    // const atalhos = $(tableId + ' thead th:eq(5)')
    // const genero = table.column( 4 )
    // console.log(genero)
    // genero.visible(false)
    // const w = window.innerWidth
    // console.log(window.innerWidth)
    // if (w <= 608){
    //   atalhos.width('65%'); 
    // }
    // else if (w <= 686){
    //   atalhos.width('300px'); 
    // }
    // else if (w <= 785){
    //   atalhos.width('200px'); 
    // }
    // else if (w <= 950){
    //   atalhos.width('20%'); 
    // }
    // else if (w <= 1366){
    //   atalhos.width('15%');
    // } 
    // else {
    //   atalhos.width('10%')
    // }
  })

  const search = $('#patient-search')

  search.on('keyup', function () {
    table.search(this.value).draw()
  })

  let cont = 0;
  $('.add-aspects').on('click', () => {
    cont += 1;
    $('.facilities tbody').append(
      '<tr id="' + cont + '">' +
      '<td><input multiple="multiple" type="text" value="" name="form[facilities][]" id="form_facilities"></td>' +
      '<td><input multiple="multiple" type="text" value="" name="form[dificulties][]" id="form_dificulties"></td>' +
      '<td><div class="remove-aspects" onclick="remove(' + cont + ')"><i class="fa fa-times"></i></div></td>' +
      '</tr>')
  })

  function remove(id) {
    $('#' + id).remove();
  }
})
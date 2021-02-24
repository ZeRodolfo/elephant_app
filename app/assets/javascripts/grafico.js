$(() => {
    const get = (selector) => document.getElementById(selector)
    const kindSelect = get('laudo_grafico_attributes_kind')
    const originalKind = get('grafico-kind').value || 'bar'
    const dataElement = get('grafico-data')
    const originalData = (dataElement.value) ? JSON.parse(dataElement.value) : []
    const randomColor = () => Math.floor(Math.random()*16777215).toString(16)
    const title = get('laudo_grafico_attributes_title')
    const ctx = get('grafico').getContext('2d')
    const kinds = ['bar', 'pizza', 'radar']

    let grafico = null
    buildGraficoFor(kindSelect.value)

    show(originalKind)

    if (originalData)
        fill(originalData, originalKind)

    function buildGraficoFor(kind){
        if (grafico){
            grafico.destroy()
        }
        if (kind == 'bar'){
            grafico =  new Chart(ctx, {
                plugins: [ChartDataLabels],
                type: 'bar',
                data: [],
                options: {
                    title: {
                        display: true,
                        text: title.value
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                suggestedMin: 0,
                                suggestedMax: 100,
                                stepSize: 5,
                                beginAtZero: true
                            }
                        }]
                    },
                    responsive: true,
                    legend: {
                        position: 'bottom',
                    },
                    plugins: {
                        datalabels: {
                            color: 'black',
                            font: {
                                size: 14,
                                weight: 'bold',
                                family: '"Lucida Console", Monaco, monospace',
                            },
                            align: 'end',
                            anchor: 'end',
                        }
                    }
                }
            })
        }
        else if (kind == 'pizza'){
            grafico = new Chart(ctx, {
                plugins: [ChartDataLabels],
                type: 'pie',
                data: {
                    datasets: [{
                        data: [

                        ],
                        backgroundColor: [

                        ],
                        label: ''
                    }],
                    labels: [

                    ]
                },
                options: {
                    responsive: true,
                    title: {
                        text: title.value,
                        display: true
                    },
                    plugins: {
                        datalabels: {
                            color: 'white',
                            font: {
                                size: 14,
                                weight: 'bold',
                                family: '"Lucida Console", Monaco, monospace',
                            },
                            align: 'center',
                        }
                    }
                }
            })
        }
        else if (kind == 'radar'){
            grafico = new Chart(ctx, {
                plugins: [ChartDataLabels],
                type: 'radar',
                data: {
                    datasets:
                    [
                        {
                            label: 'Radar',
                            backgroundColor: hexToRgba('#45AA77'),
                            data: []
                        }
                    ]
                },
                options: {
                    responsive: true,
                    title: {
                        text: title.value,
                        display: true
                    },
                    scale: {
                        ticks: {
                            suggestedMin: 0,
                            suggestedMax: 50,
                            stepSize: 10,
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        datalabels: {
                            backgroundColor: function(context) {
                              return hexToRgba('#45AA77');
                            },
                            padding: 4,
                            color: 'black',
                            font: {
                                size: 12,
                                weight: 'bold',
                                family: '"Lucida Console", Monaco, monospace',
                            },
                            align: 'end',
                            anchor: 'end',
                          }
                    }
                }
            })
        }

        grafico.update()
    }

    function hideAll(){
        kinds.forEach(i => $(`#${i}-related`).hide())
    }

    function clearAll(){
        kinds.forEach(i => $(`#${i}-fields`).html(''))
    }

    function cclean(kind){
        $('#radar-vertices').html('')
        $('#radar-fields').html('')
        hideRadarValues()
        showVerticesInputs()

        title.value = ''
        buildGraficoFor(kind)
        show(kind)
    }

    $('#cclean').on('click', function(e){
        const b = confirm('Certeza que deseja limpar todo o gráfico?')
        if (b)
            cclean(kindSelect.value)
    })

    function show(i){
        hideAll()
        clearAll()
        $(`#${i}-related`).show()
    }

    title.addEventListener('keyup', function(event){
        grafico.options.title.text = title.value
        grafico.update()
    })

    kindSelect.addEventListener('change', function(event){
        buildGraficoFor(kindSelect.value)
        show(kindSelect.value)
    })

    function buildBarFieldset(label = 'Coluna ' + (barFormsetCount() + 1), color = '#708090', value = 0){
        return $(
            $('#bar-formset').html()
            .replaceAll('INDEX', barFormsetCount())
            .replace('BAR-TITLE', label)
            .replace('BAR-VALUE', value)
            .replace('BAR-COLOR', color)
        )
    }

    function fill(data, kind){
        if (kind == 'bar'){
            const arrOfData = objToArray(data)
            // grafico.data.datasets = {...data, ...grafico.data.datasets}
            for (const d of arrOfData){
                grafico.data.datasets.push(
                    {
                        label: d.label,
                        backgroundColor: d.backgroundColor,
                        borderColor: d.borderColor,
                        data: [parseFloat(d.data[0])],
                        index: barFormsetCount()
                    }
                )
                $('#bar-fields').append(buildBarFieldset(
                    d.label,
                    d.backgroundColor,
                    parseFloat(d.data[0])
                ))
            }
        }
        else if (kind == 'pizza'){
            if (!data.labels || !data.labels.length){ return }
            for (let i = 0; i < data.labels.length; i++){
                grafico.data.labels[i] = data.labels[i]
                grafico.data.datasets[0].data[i] = parseFloat(data.data[i])
                grafico.data.datasets[0].backgroundColor[i] = data.backgroundColor[i]

                $('#pizza-fields').append(buildPizzaFieldset(
                    data.labels[i],
                    data.backgroundColor[i],
                    parseFloat(data.data[i])
                ))
            }
        }
        else if (kind == 'radar'){
            data.labels.forEach((label, i) => {
                const value = data.data[i] ? data.data[i] : 0
                buildRadarValueInput(label, i, value)
                grafico.data.labels.push(label)
                grafico.data.datasets[0].data.push(value)
            })
            hideVerticesInputs()
            $('#radar-fields').show()
        }

        grafico.update()
    }

    const getBarLabelForIndex = (index) => $(`.bar-title[data-index="${index}"]`).val()
    const getBarValueForIndex = (index) => $(`.bar-value[data-index="${index}"]`).val()
    const getBarColorForIndex = (index) => $(`.bar-color[data-index="${index}"]`).val()

    function barFormsetCount(){
        if (!$('#bar-fields .bar-formset').length){ return 0 }

        let max = parseInt($('#bar-fields .bar-formset').first().data('index'))
        $('#bar-fields .bar-formset').each(function(i, e){
            const v = parseInt(this.dataset['index'])
            if (v > max){
                max = v
            }
        })
       return max + 1
    }

    function removeBarDataset(index){
        const ds = findBarDataset(index)
        grafico.data.datasets = grafico.data.datasets.filter(ds => ds.index != index)
        grafico.update()
    }

    $('body').on('click', '.bar-remove', function(e){
        const index = this.dataset['index']
        $(`.bar-formset[data-index="${index}"]`).remove()
        removeBarDataset(index)
    })

    $('body').on('keyup', '.bar-title', function(){
        const index = parseInt(this.dataset['index'])
        const ds = findBarDataset(index)
        ds.label = this.value
        grafico.update()
    })

    function findBarDataset(index){
        return grafico.data.datasets.filter(d => d.index == index)[0]
    }

    $('body').on('change', '.bar-color', function(e){
        const index = parseInt(this.dataset['index'])
        const ds = findBarDataset(index)
        ds.borderColor = this.value
        ds.backgroundColor = this.value
        grafico.update()
    })

    $('body').on('change keyup', '.bar-value',function(){
        const index = parseInt(this.dataset['index'])
        const ds = findBarDataset(index)
        ds.data[0] = this.value
        grafico.update()
    })

    get('add-bar').addEventListener('click', function(event){
        const index = barFormsetCount()
        grafico.data.datasets.push({
            label: 'Coluna ' + (barFormsetCount() + 1),
            backgroundColor: '#708090',
            borderColor: '#708090',
            data: [0],
            index: index
        })
        $('#bar-fields').append(buildBarFieldset())
        grafico.update()
    })

    // --------------------------

    get('add-radar').addEventListener('click', function(event){

        $('#radar-vertices').append(buildRadarVerticeInput())
        grafico.update()
    })

    function radarVerticeCount(){
        if (!$('#radar-vertices .radar-vertice-formset').length){ return 0 }

        let max = parseInt($('#radar-vertices .radar-vertice-formset').first().data('index'))
        $('#radar-vertices .radar-vertice-formset').each(function(i, e){
            const v = parseInt(this.dataset['index'])
            if (v > max){
                max = v
            }
        })
       return max + 1
    }

    function buildRadarVerticeInput(){
        const $el = $('#radar-vertices-formset').html().replaceAll('RADAR-VERTICE-INDEX', radarVerticeCount()).replace('RADAR-VERTICE-VALUE', 'Vertice ' + (radarVerticeCount() + 1))
        return $el
    }

    function getVertices(){
        const a = []
        $('#radar-vertices .radar-vertice-label').each(function(i, e){
            a.push(e.value)
        })
        return a
    }

    $('#ok-vertices').on('click', function(){
        const vertices = getVertices()
        if (vertices.length < 3){
            alert('O radar precisa de pelo menos 3 vértices.')
            return
        }

        grafico.data.labels = vertices
        grafico.update()
        hideVerticesInputs()
        showRadarValuesForVertices(vertices)
    })

    function hideVerticesInputs(){
        $('#vvvvv').hide()
    }

    function showVerticesInputs(){
        $('#vvvvv').show()
    }

    function hideRadarValues(){
        $('#radar-fields').hide()
    }

    function showRadarValuesForVertices(vertices){
        // for (const vertice of vertices){
        vertices.forEach((v, i) => {
            buildRadarValueInput(v, i)
        })
        $('#radar-fields').show()
    }

    function buildRadarValueInput(vertice, index, value=0){
        const $el = $($('#radar-formset .radar-formset').html().replaceAll('INDEX', index).replace('RADAR-VALUE-LABEL', vertice).replace('RADAR-VALUE', value))
        $('#radar-fields').append($el)
    }

    $('body').on('change keyup', '.radar-value', function(e){
        const index = parseInt(this.dataset['index'])
        grafico.data.datasets[0].data[index] = parseFloat(this.value)
        grafico.update()
    })

    $('body').on('click', '.radar-vertice-remove', function(e){
        const index = this.dataset['index']
        $(`.radar-vertice-formset[data-index="${index}"]`).remove()
        reIndexVertices()
    })

    function reIndexVertices(){
        $('#radar-vertices .radar-vertice-formset').each(function(i, e){
            const $e = $(e)
            $e.attr('data-index', i)
            $e.find('input.radar-vertice-label').attr('data-index', i)
            $e.find('button.radar-vertice-remove').attr('data-index', i)
        })
    }

    // ---------------------

    function buildPizzaFieldset(label = 'Fatia ' + (pizzaFormsetCount() + 1), color = '#708090', value = 0){
        return $(
            $('#pizza-formset').html()
            .replaceAll('INDEX', pizzaFormsetCount())
            .replace('PIZZA-TITLE', label)
            .replace('PIZZA-VALUE', value)
            .replace('PIZZA-COLOR', color)
        )
    }

    function pizzaFormsetCount(){
        return  parseInt($('#pizza-fields .pizza-formset').length)
    }

    get('add-pizza').addEventListener('click', function(event){
        const index = pizzaFormsetCount()
        grafico.data.labels[index] = 'Fatia ' + (index + 1)
        grafico.data.datasets[0].data[index] = 0
        grafico.data.datasets[0].backgroundColor[index] = '#708090'

        $('#pizza-fields').append(buildPizzaFieldset())
        grafico.update()
    })

    function removePizzaDataset(index){
        grafico.data.labels[index] = 'Fatia ' + (index + 1)
        grafico.data.datasets[0].data[index] = 0
        grafico.data.datasets[0].backgroundColor[index] = '#708090'
        grafico.update()
    }

    $('body').on('click', '.pizza-remove', function(e){
        const index = parseInt(this.dataset['index'])
        reset($(`.pizza-formset[data-index="${index}"]`))
        removePizzaDataset(index)
    })

    function reset($el){
        const index = parseInt($el[0].dataset['index'])
        $el.find('input[type="text"]').val('Fatia ' + (index + 1))
        $el.find('input[type="number"]').val(0)
        $el.find('input[type="color"]').val('#708090')
    }

    $('body').on('keyup', '.pizza-title', function(){
        const index = parseInt(this.dataset['index'])
        grafico.data.labels[index] = this.value
        grafico.update()
    })

    $('body').on('change', '.pizza-color', function(e){
        const index = parseInt(this.dataset['index'])
        grafico.data.datasets[0].backgroundColor[index] = this.value
        grafico.update()
    })

    $('body').on('change keyup', '.pizza-value', function(){
        const index = parseInt(this.dataset['index'])
        grafico.data.datasets[0].data[index] = this.value
        grafico.update()
    })

    $('form').on('submit', function(event){
        let datasets
        if (kindSelect.value == 'bar'){
            datasets = $.extend(true, {}, grafico.data.datasets)
            datasets = arrayToObj(cleanBar(objToArray(datasets)))
        }
        else if (kindSelect.value == 'pizza'){
            datasets = $.extend(true, {}, grafico.data.datasets[0])
            datasets.labels = Array.from(grafico.data.labels)
            datasets = cleanPizza(datasets)
        }
        else if (kindSelect.value == 'radar'){
            datasets = {
                data: Array.from(grafico.data.datasets[0].data),
                labels: Array.from(grafico.data.labels)
            }
        }

        $('#grafico-image').val(grafico.toBase64Image().split(',')[1])
        $('#grafico-data').val(JSON.stringify(datasets))
    })

    console.clear()
})

function hexToRgba(hex) {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)
  const r = result
    ? `rgba(${parseInt(result[1], 16)}, ${parseInt(result[2], 16)}, ${parseInt(
        result[3],
        16
      )}, 0.5)`
    : "rgba(0, 0, 0, 0.1)"

  return r
}

function debounce(func, wait, immediate) {
    var timeout
    return function() {
        var context = this, args = arguments
        var later = function() {
            timeout = null
            if (!immediate) func.apply(context, args)
        }
        var callNow = immediate && !timeout
        clearTimeout(timeout)
        timeout = setTimeout(later, wait)
        if (callNow) func.apply(context, args)
    }
}

function filterObject(obj, key) {
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            filterObject(obj[i], key);
        } else if (i == key) {
            delete key;
        }
    }
    return obj;
}

function clone(obj){
    return JSON.parse(JSON.stringify(obj))
}

function cleanBar(arr){
    return arr.map(d => {
        delete d['_meta']
        return d
    }).filter(d => d.label != "")
}

function cleanPizza(data){
    delete data['_meta']
    const labelsToPop = []
    const dataToPop = []
    const bgsToPop = []

    const dup = Array.from(data.data)

    dup.forEach((d, i) => {
        if (d == 0){
            data.data[i] = null
            data.labels[i] = null
            data.backgroundColor[i] = null
        }
    })

    data.data = data.data.filter(d => d != null)
    data.labels = data.labels.filter(d => d != null)
    data.backgroundColor = data.backgroundColor.filter(d => d != null)

    return data
}

function objToArray(o){
    return Object.values(o)
}

function arrayToObj(a){
    return Object.assign({}, ...a.map((s, i) => { return ({[i]: s}) }))
}

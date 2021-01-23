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
                                suggestedMax: 30,
                                stepSize: 1,
                                beginAtZero: true
                            }
                        }]
                    },
                    responsive: true,
                    legend: {
                        position: 'bottom',
                    }
                }
            })
        }
        else if (kind == 'pizza'){
            grafico = new Chart(ctx, {
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
                }
            })
        }
        else if (kind == 'radar'){
            grafico = null
        }
        else {
            throw ('Erro no tipo do gráfico.')
        }
    }

    function hideAll(){
        kinds.forEach(i => $(`#${i}-related`).hide())
    }

    function clearAll(){
        kinds.forEach(i => $(`#${i}-fields`).html(''))
    }

    function cclean(kind){
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
        grafico.destroy()
        grafico = buildGraficoFor(kindSelect.value)
        grafico.update()
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
        // event.preventDefault()
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

        }

        $('#grafico-data').val(JSON.stringify(datasets))
    })

    window.grafico = grafico
})

function hexToRgba(hex) {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)
  const r = result
    ? `rgba(${parseInt(result[1], 16)}, ${parseInt(result[2], 16)}, ${parseInt(
        result[3],
        16
      )}, 0.1)`
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

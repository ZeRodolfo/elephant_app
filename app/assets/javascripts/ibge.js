$(() => {
    $uf = $('#uf')
    $city = $('#city')

    fetchStates()

    $uf.on('change', function (event) {
        const option = $("option:selected", this)

        fetchCities(option.data('id'))
    })

    function fetchCities(stateId, callback = function(){}) {
        $city.html('')
        disable($city)
        fetch(`https://servicodados.ibge.gov.br/api/v1/localidades/estados/${stateId}/municipios?orderBy=nome`).then(
            response => response.json().then(cidades => {
                for (const cidade of cidades) {
                    $city.append($('<option>', {
                        value: cidade.nome,
                        text: cidade.nome,
                        'data-id': cidade.id
                    }))
                }

                enable($city)
                callback()
            })
        ).catch(e => {
            transformSelectIntoInput($city)
            $uf.off('change')
        })
    }

    function transformSelectIntoInput(element) {
        element.replaceWith($('<input />').attr({
            type: 'text',
            id: element.attr('id'),
            name: element.attr('name'),
            class: element.attr('class'),
            required: true
            // value: element.val()
        }))
    }

    function disable(element) {
        element.attr('disabled', 'true')
    }

    function enable(element) {
        element.removeAttr('disabled')
    }

    function fetchStates() {
        $uf.html('')
        disable($uf)
        fetch('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome').then(
            response => response.json().then(estados => {
                for (const estado of estados) {
                    $uf.append($('<option>', {
                        value: estado.sigla,
                        text: estado.nome,
                        'data-id': estado.id
                    }))
                }

                enable($uf)
                $uf.trigger('change')
                changeSelection()
            })
        ).catch(e => {
            $uf.off('change')
            transformSelectIntoInput($uf)
            transformSelectIntoInput($city)
        })
    }

    function changeSelection(){
        const city = $('#city_value').val()
        const uf = $('#uf_value').val()

        if (city && uf){
            selectUfByName(uf)
            const option = $("option:selected", $uf)
    
            fetchCities(option.data('id'), function(){
                selectCityByName(city)
            })
        }
    }

    function selectCityByName(city){
        $city.val(city)
        $city.trigger('change')
    }

    function selectUfByName(uf){
        $uf.val(uf)
        $uf.trigger('change')
    }
})
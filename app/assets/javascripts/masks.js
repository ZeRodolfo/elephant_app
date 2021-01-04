const masks = {
    'cpf': '000.000.000-00',
    'cnpj': '9.999.999/9999-99',
    'cep': '99999-999',
    'telefone': '(99) #99999999',
    'nascimento': '00/00/0000'
}

$(() => {
    const identifiers = Object.keys(masks)

    for (const clazz of identifiers){
        $(`.${clazz}`).mask(masks[clazz])
    }
    console.log('masked')
})
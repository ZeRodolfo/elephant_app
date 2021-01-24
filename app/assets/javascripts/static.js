function resizeElements(){
    setCardHeight()
}

function setCardHeight(){
    const cardList = $('.card-el')
    let maxHeaderHeight = 0
    let maxTextHeight = 0

    cardList.each((i, card) => {
        const $cardBody = $(card).find('.card-body')
        const $cardHeader = $cardBody.find('.card-head')
        const $cardText = $cardBody.find('.card-text')
        
        $cardHeader.css('height', '')
        $cardText.css('height', '')

        const cardTextHeight = parseFloat($cardText.css('height'))
        const cardHeaderHeight = parseFloat($cardHeader.css('height'))

        if (cardHeaderHeight > maxHeaderHeight){
            maxHeaderHeight = cardHeaderHeight
        }

        if (cardTextHeight > maxTextHeight){
            maxTextHeight = cardTextHeight
        }
    })

    cardList.each((i, card) => {
        $(card).find('.card-text').css('height', maxTextHeight)
        $(card).find('.card-head').css('height', maxHeaderHeight)
    })
}



$(() => {
    // setCardHeight()

    // $(window).on('optimizedResize', resizeElements)
})


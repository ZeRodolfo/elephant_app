$(() => {
    $('.card-home').on('click', function(event){
        window.location.href = this.dataset['link']
    })
})

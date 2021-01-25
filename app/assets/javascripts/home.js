$(document).on('turbolinks:load', () => {
  $(document).on('click', '.card-home', function (event) {
    window.location.href = this.dataset['link']
  })
})

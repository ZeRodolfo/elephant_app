$(document).on('click', '.card-home', function (event) {
  const l = this.dataset['link']
  if (!l){ return }
  window.location.href = l
})

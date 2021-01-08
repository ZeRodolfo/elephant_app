$(document).on('turbolinks:load', function () {
    let selected = {
        start: {},
        end: {}
    }

    let focused = 's'

    const $start = $('#start-date')
    const $end = $('#end-date')

    // Todo: Better way?
    $start.on('focus', function(e){
        focused = 's'
    })

    $end.on('focus', function(e){
        focused = 'e'
    })

    const calendarDiv = document.getElementById('calendar')
    const calendar = new FullCalendar.Calendar(calendarDiv, {
    // const calendar = $('#calendar').fullCalendar({
        themeSystem: 'bootstrap',
        locale: 'pt-br',
        dateClick: function(info) {
            if (focused == 's'){
                $start.val(toLocale(info.dateStr))
            }
            else {
                $end.val(toLocale(info.dateStr))
            }
            
            selectDate(info.dayEl)
        }
    })

    calendar.render()

    function selectDate(dayEl){
        if (focused == 's'){
            changeDateBg(selected.start, dayEl, '#45AA77')
        }
        else {
            changeDateBg(selected.end, dayEl, '#dc3545')
        }
    }

    function changeDateBg(d, dayEl, color){
        if (d.el){
            d.el.style.backgroundColor = d.oldColor
        }

        d.oldColor = dayEl.style.backgroundColor
        dayEl.style.backgroundColor = color
        d.el = dayEl
    }
})



function toLocale(mmDdYyyy){
    const [year, month, day] = mmDdYyyy.split('-') // 2021-01-23

    if (!year || !month || !day){
        throw 'Formato inválido'
    }
    return `${day}/${month}/${year}`
}
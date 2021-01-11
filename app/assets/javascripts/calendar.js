$(document).on('turbolinks:load', function () {
    const selected = {
        start: {},
        end: {}
    }

    const startColor = '#45AA77'
    const endColor = '#dc3545'

    const SEMANAL = 1
    const QUINZ = 2
    const MENSAL = 3

    const hasStartSelected = () => selected.start && selected.start.date
    const hasEndSelected = () => selected.end && selected.end.date

    let focused = 'startDate'

    const $start = $('#start-date')
    const $end = $('#end-date')
    const $hour = $('#hour')

    // Todo: Better way?
    $start.on('focus', function (endDate) {
        focused = 'startDate'
    })

    $end.on('focus', function (endDate) {
        focused = 'endDate'
    })

    const calendarDiv = document.getElementById('calendar')
    const calendar = new FullCalendar.Calendar(calendarDiv, {
        // const calendar = $('#calendar').fullCalendar({
        themeSystem: 'bootstrap',
        locale: 'pt-br',
        dateClick: function (info) {
            if (focused == 'startDate') {
                $start.val(toLocale(info.dateStr))
            }
            else {
                $end.val(toLocale(info.dateStr))
            }
            
            selectDate(info.dayEl)
        },
        datesSet: function (info) {
            repaint()
        }
    })

    calendar.render()

    $(calendarDiv).append(
        `
        <div class="my-2">
            <!-- <p class="subtitle m-0">Legenda</p> -->
            <p class="m-0">
                <svg class="bi bi-circle-fill" style="color: ${startColor}" width="1em" height="1em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="10" cy="10" r="8"></circle>
                </svg>
                <span class="phrase">Início</span>
            </p>
            

            <p class="m-0">
                <svg class="bi bi-circle-fill" style="color: ${endColor}" width="1em" height="1em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="10" cy="10" r="8"></circle>
                </svg>
                <span class="phrase">Fim</span>
            </p>
        </div>
        `
    )

    function repaint() {
        clearPaint()
        if (hasStartSelected()) {
            getDateDiv(selected.start.date).css('backgroundColor', selected.start.currentColor)
        }

        if (hasEndSelected()) {
            getDateDiv(selected.end.date).css('backgroundColor', selected.end.currentColor)
        }
    }

    function clearPaint() {
        if (hasStartSelected())
            paintDate(selected.start.date, selected.start.oldColor)
        if (hasEndSelected())
            paintDate(selected.end.date, selected.end.oldColor)
    }

    function selectDate(dayEl) {
        if (focused == 'startDate') {
            changeDateBg(selected.start, dayEl.dataset['date'], startColor)
        }
        else {
            changeDateBg(selected.end, dayEl.dataset['date'], endColor)
        }
    }

    function getDateDiv(dateString) {
        return $(`[data-date="${dateString}"]`)
    }

    function paintDate(dateString, color) {
        getDateDiv(dateString).css('backgroundColor', color)
    }

    function changeDateBg(selectionInfo, dateString, color) {
        if (selectionInfo.date) {
            paintDate(selectionInfo.date, selectionInfo.oldColor)
        }

        selectionInfo.oldColor = getDateDiv(dateString).css('backgroundColor')
        paintDate(dateString, color)
        selectionInfo.date = dateString
        selectionInfo.currentColor = color
    }

    $('#submit-multiple').on('click', (event) => {
        clearErrors()
        $('#visits').val('')

        const startDate = new Date(toYyyyMmDd($start.val()) + 'T00:00:00')
        const endDate = $end.val() ? new Date(toYyyyMmDd($end.val()) + 'T00:00:00') : null
        const hour = $hour.val()

        if (endDate && isInvalid(startDate, endDate)){ 
            const errorMsg = "A data inicial precisa ser menor que a final."

            $start.addClass('is-invalid')
            $end.addClass('is-invalid')

            $start.parent().closest('div.invalid-feedback').html(errorMsg)
            $end.parent().closest('div.invalid-feedback').html(errorMsg)
            event.preventDefault() 
            return
        }

        const repeat = parseInt($('#repetition-select :selected').val())
        let visits = []
        switch (repeat) {
            default: case 0:
                visits = [ buildVisit(startDate, hour) ]
                break;
            case SEMANAL:
                visits = repeatWeekly(startDate, endDate, hour)
            break;
            case QUINZ:
                visits = repeatQuinzenally(startDate, endDate, hour)
            break;
            case MENSAL:
                visits = repeatMonthly(startDate, endDate, hour)
            break;
        }

        console.log(visits)

        $('#visits').val(JSON.stringify(visits))
    })

    function clearErrors() {
        const form = $('form')[0]
      
        const fields = Array.from(form.elements)
      
        for (const field of fields) {
          field.classList.remove('is-invalid')
        }
    }

    // function isInvalid(start, end){ 
    //     const invalidity = !isDateLessOrEqual(start, end)
    //     if (invalidity){
    //         $start.addClass('is-invalid')
    //         $end.addClass('is-invalid')
    //     }
    //     return invalidity
    // }

    function isInvalid(start, end){ 
        return !isDateLessOrEqual(start, end)
    }
})



function toLocale(mmDdYyyy) {
    const [year, month, day] = mmDdYyyy.split('-') // 2021-01-23

    if (!year || !month || !day) {
        // throw 'Formato inválido'
        return null
    }
    return `${day}/${month}/${year}`
}

function toYyyyMmDd(ddMmYyyy) {
    const [day, month, year] = ddMmYyyy.split('/') // 23/01/2021

    if (!year || !month || !day) {
        // throw 'Formato inválido'
        return null
    }
    return `${year}-${month}-${day}`
}

function canAddDays(startDate, endDate, days) {
    let _s = new Date(startDate)
    _s.setDate(_s.getDate() + days)
    return _s.getTime() <= endDate.getTime()
}

function repeatWeekly(startDate, endDate, hour) {
    return _repeatByDays(startDate, endDate, 7, hour)
}

function _repeatByDays(startDate, endDate, interval, hour){
    const dates = [buildVisit(startDate, hour)]
    while (canAddDays(startDate, endDate, interval)) {
        startDate.setDate(startDate.getDate() + interval)
        dates.push(buildVisit(new Date(startDate), hour))
    }
    return dates
}

function repeatQuinzenally(startDate, endDate, hour) {
    return _repeatByDays(startDate, endDate, 15, hour)
}

function canAdd30(startDate, endDate) {
    let _s = new Date(startDate)
    add1Month(_s)
    return isDateLessOrEqual(_s, endDate)
}

function isDateLessOrEqual(date1, date2) {
    let _date1 = new Date(
        date1.getFullYear(),
        date1.getMonth(),
        date1.getDay(), 0, 0, 0, 0
    )

    let _date2 = new Date(
        date2.getFullYear(),
        date2.getMonth(),
        date2.getDay(), 0, 0, 0, 0
    )

    return _date1 <= _date2
}

function repeatMonthly(startDate, endDate, hour) {
    const dates = [buildVisit(new Date(startDate), hour)]
    while (canAdd30(startDate, endDate)) {
        add1Month(startDate)
        dates.push(
            buildVisit(new Date(startDate), hour),
        )
    }
    return dates
}

function isLeapYear(year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0))
}

function getDaysInMonth(year, month) {
    return [31, (isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month]
}

function add1Month(date) {
    date.setMonth(date.getMonth() + 1)
}

Date.prototype.toISO = function(){
    return JSON.stringify(this).split('T')[0].replace('"', '')
}

function buildVisit(date, hour){
    return {
        date: date instanceof Date ? date.toISO() : date,
        hour
    }
}
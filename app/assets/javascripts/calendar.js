$(document).on('turbolinks:load', () => {
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

  const viewOptions = {
    headerToolbar: {
      left: 'dayGridMonth semanal quinzena dia',
      center: 'title'
    },
    views: {
      semanal: {
        allDaySlot: false,
        type: 'timeGrid',
        duration: { days: 7 },
        buttonText: 'Semana',
        slotLabelFormat: function (date){
          return date.date.hour.toString().padStart(2, '0') + 'h'
        }
      },
      quinzena: {
        allDaySlot: false,
        type: 'timeGrid',
        duration: { days: 15 },
        buttonText: 'Quinzena',
        slotLabelFormat: function (date){
          return date.date.hour.toString().padStart(2, '0') + 'h'
        }
      },
      dia: {
        allDaySlot: false,
        type: 'timeGrid',
        duration: { days: 1 },
        buttonText: 'Dia',
        slotLabelFormat: function (date){
          return date.date.hour.toString().padStart(2, '0') + 'h'
        }
      }
    }
  }

  const calendarOptions = {
    timeZone: 'UTC',
    eventTimeFormat: {
      hour: '2-digit',
      minute: '2-digit',
      meridiem: false,
      omitZeroMinute: false,
    },
    themeSystem: 'bootstrap',
    locale: 'pt-br',
    dateClick: function (info) {
      if (!hasInputs) { return }

      if (focused == 'startDate') {
        $start.val(toLocale(info.dateStr))
      }
      else {
        $end.val(toLocale(info.dateStr))
      }

      selectDate(info.dayEl)
    },
    datesSet: function (info) {
      if (!hasInputs) { return }
      repaint()
    },
    eventDidMount: function (info) {
      const patientName = info.event.title.split('-')[0].trim()
      const el = info.el
      $(el).tooltip({
        // title: `<span class="text-nowrap">${info.event.title.split('-')[0].trim()} <br> ${info.event.title.split('-')[1].trim()} </span>`,
        title: `<span class="text-wrap">${patientName}</span>`,
        container: el,
        html: true,
      })

      setTimeout(() => {
        $(info.el).children('.fc-event-title').text(patientName)
      }, [0]);
    },
    bootstrapFontAwesome: false,
  }

  const hasInputs = $start[0] != undefined

  // Todo: Better way?
  $start.on('focus', function (endDate) {
    focused = 'startDate'
  })

  $end.on('focus', function (endDate) {
    focused = 'endDate'
  })

  const calendarDiv = document.getElementById('calendar')
  const calendar = new FullCalendar.Calendar(calendarDiv, hasInputs ? calendarOptions : {...calendarOptions, ...viewOptions})

  calendar.render()

  window.calendar = calendar

  if (hasInputs) {
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
  }

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

Date.prototype.toISO = function () {
  return JSON.stringify(this).split('T')[0].replace('"', '')
}

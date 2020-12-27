function currentStep() {
    return document.querySelector('.step.active')
}

function allSteps() {
    return document.querySelectorAll('.step')
}

function currentStepContent() {
    return document.querySelector('.step-content.visible')
}

function currentStepNumber() {
    return parseInt(currentStep().dataset.step)
}

function showStep(number) {
    let step = document.querySelector(`[data-step='${number}']`)
    let stepContent = document.querySelector(`[data-step-content='${number}']`)

    currentStep().classList.remove('active')
    $(currentStepContent()).fadeOut('fast', () => {
        currentStepContent().classList.remove('visible')

        $(stepContent).fadeIn('fast', () => {
            stepContent.classList.add('visible')
        })
    })

    step.classList.add('active')
}

function addVisible(selector) {
    let element = document.querySelector(selector)

    if (element !== undefined && element !== null) {
        element.classList.add('visible')
    }
}

function removeVisible(selector) {
    let element = document.querySelector(selector)

    if (element !== undefined && element !== null) {
        element.classList.remove('visible')
    }
}

function update() {
    let current = currentStepNumber()
    let length = allSteps().length

    if (current == length) {
        removeVisible('.step-next')
        addVisible('.step-submit')
    } else {
        addVisible('.step-next')
        removeVisible('.step-submit')
    }

    if (current == 1) {
        removeVisible('.step-prev')
    } else {
        addVisible('.step-prev')
    }
}

function nextStep() {
    let next = currentStepNumber() + 1

    if (next <= allSteps().length) {
        showStep(next)
    }

    update()
}

function prevStep() {
    let prev = currentStepNumber() - 1

    if (prev > 0 && prev <= allSteps().length) {
        showStep(prev)
    }

    update()
}
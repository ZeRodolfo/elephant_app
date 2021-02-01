$(() => {
    $('form').disableAutoFill({
        passwordField: '.no-complete-password',
        html5FormValidate: true
    })
})

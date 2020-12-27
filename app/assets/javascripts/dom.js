
(function() {
    var throttle = function(type, name, obj) {
        obj = obj || window
        var running = false
        var func = function() {
            if (running) { return }
            running = true
             requestAnimationFrame(function() {
                obj.dispatchEvent(new CustomEvent(name))
                running = false
            })
        }
        obj.addEventListener(type, func)
    }

    throttle("resize", "optimizedResize")
})()

/*
$(() => {
    function calcRemaining(){
        if ($('section.remaining-height').length == 0 || false){ return }

        const vh = innerHeight * 0.01 // workaround to compensate for softkeys on android
        $('section.remaining-height').css('height', `calc((${vh}px * 100) - ${$('#navbar').css('height')})`) 
    }

    function resizeElements(){
        calcRemaining()
    }

    window.addEventListener('optimizedResize', resizeElements)

    resizeElements()
})
*/
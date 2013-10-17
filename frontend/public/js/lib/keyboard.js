define(['lib/events', 'lib/dom', 'jquery'], function (events, dom, $) {
    var keys = {
        down: 40,
        up: 38,
        right: 39,
        left: 37,
        r: 82,
        esc: 27
    };

    function bindKeysToEvents() {
        document.addEventListener('keyup', function (e) {
            if (e.keyCode === keys.r) {
                events.loadApp.dispatch();
            } else if (e.keyCode === keys.esc) {
                events.hideApp.dispatch();
            }
        });
    }

    return {
        init: function () {
            bindKeysToEvents();
        }
    };
});
define(['lib/events', 'lib/dom', 'jquery'], function (events, dom, $) {
    var keys = {
        down: 40,
        up: 38,
        right: 39,
        left: 37,
        r: 82,
        esc: 27,
        enter: 13
    };

    function bindKeysToEvents() {
        document.addEventListener('keyup', function (e) {
            if (e.keyCode === keys.r) {
                events.loadApp.dispatch();
            } else if (e.keyCode === keys.esc) {
                events.pressEsc.dispatch();
            } else if (e.keyCode === keys.up) {
                events.moveUp.dispatch();
            } else if (e.keyCode === keys.down) {
                events.moveDown.dispatch();
            } else if (e.keyCode === keys.right) {
                events.moveRight.dispatch();
            } else if (e.keyCode === keys.left) {
                events.moveLeft.dispatch();
            } else if (e.keyCode === keys.enter) {
                events.pressEnter.dispatch();
            }
        });
    }

    return {
        init: function () {
            bindKeysToEvents();
        }
    };
});
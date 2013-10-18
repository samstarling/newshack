define(['signals'], function (signals) {
    return {
        loadApp : new signals.Signal(),
        pressEsc: new signals.Signal(),
        moveUp: new signals.Signal(),
        moveDown: new signals.Signal(),
        moveLeft: new signals.Signal(),
        moveRight: new signals.Signal(),
        pressEnter: new signals.Signal(),
        openContent: new signals.Signal(),
        pressS: new signals.Signal()
    };
});
define(['signals'], function (signals) {
    return {
        loadApp : new signals.Signal(),
        hideApp : new signals.Signal(),
        moveUp: new signals.Signal(),
        moveDown: new signals.Signal(),
        moveLeft: new signals.Signal(),
        moveRight: new signals.Signal()
    };
});
define(['signals'], function (signals) {
    return {
        loadApp : new signals.Signal(),
        hideApp : new signals.Signal()
    };
});
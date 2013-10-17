define(['lib/events', 'lib/dom'], function (events, dom) {
    function loadApp() {
        dom.storyline.addClass('active').removeClass('inactive');
        dom.video.removeClass('active').addClass('inactive');
    }

    function hideApp() {
        dom.storyline.addClass('inactive').removeClass('active');
        dom.video.removeClass('inactive').addClass('active');
    }

    return {
        init: function () {
            events.loadApp.add(loadApp);
            events.hideApp.add(hideApp);
        }
    };
});
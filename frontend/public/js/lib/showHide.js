define(['lib/events', 'lib/dom', 'lib/navigation', 'jquery'], function (events, dom, navigation, $) {
    function loadApp() {
        dom.storyline.addClass('active').removeClass('inactive');
        dom.video.removeClass('active').addClass('inactive');
        navigation.scrollToBottom();
    }

    function hideApp() {
        dom.storyline.addClass('inactive').removeClass('active');
        dom.video.removeClass('inactive').addClass('active');
    }

    return {
        init: function () {
            events.loadApp.add(loadApp);
            events.pressEsc.add(function () {
                if ($('.reading').length === 0) {
                    hideApp();
                }
            });
            events.pressS.add(function () {
                var video = document.getElementById('news-video');

                if (video.paused === true) {
                    video.play();
                } else {
                    video.pause(); 
                    video.currentTime = 0;
                }
                $('#news-video-wrapper').toggleClass('off');
            });
        }
    };
});
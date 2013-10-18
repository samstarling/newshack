define(['jquery', 'lib/dom', 'lib/events'], function ($, dom, events) {
    var contentVideo = $('#content-video')[0],
        backgroundVideo = $('#news-video')[0];

    function bindEvents() {
        events.openContent.add(function (el) {
            var url;

            if ($(el).hasClass('video')) {
                url = $(el).attr('data-video-url');
                backgroundVideo.muted = true;
                contentVideo.src = url;
                contentVideo.play();
                $('.content-video').addClass('active');
            }
        });
        events.pressEsc.add(function () {
            $('.content-video').removeClass('active');
            backgroundVideo.muted = false;
            contentVideo.src = '';
        });
    }

    return {
        init: function () {
            bindEvents();
        }
    };
});
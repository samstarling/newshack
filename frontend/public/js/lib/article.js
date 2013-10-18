define(['jquery', 'lib/dom', 'lib/events'], function ($, dom, events) {
    var article = $('.article');

    function bindEvents() {
        events.openContent.add(function (el) {
            var title = $('.title', el).text(),
                content = $('.article-content', el).html();

            $('.reading').removeClass('reading');
            $(el).addClass('reading');
            article.addClass('active');
            $('h1', article).text(title);
            $('.article-content', article).html(content);

        });
        events.pressEsc.add(function () {
            $('.reading').removeClass('reading');
            article.removeClass('active');
        });
    }

    return {
        init: function () {
            bindEvents();
        }
    };
});
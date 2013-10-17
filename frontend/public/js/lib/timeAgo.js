define(['jquery', 'timeAgo'], function ($, timeAgo) {
    return {
        init: function () {
            $("abbr.timeago").timeago();
        }
    };
});
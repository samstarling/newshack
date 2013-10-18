require(['jquery', 'lib/navigation', 'lib/keyboard', 'lib/showHide', 'lib/timeAgo', 'lib/article', 'lib/video'], function ($, navigation, keyboard, showHide, timeAgo, article, video) {
    $(document).ready(function () {
        keyboard.init();
        showHide.init();
        navigation.init();
        timeAgo.init();
        article.init();
        video.init();
    });
});
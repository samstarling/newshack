require(['jquery', 'lib/navigation', 'lib/keyboard', 'lib/showHide', 'lib/timeAgo', 'lib/article'], function ($, navigation, keyboard, showHide, timeAgo, article) {
    $(document).ready(function () {
        keyboard.init();
        showHide.init();
        navigation.init();
        timeAgo.init();
        article.init();
    });
});
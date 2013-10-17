require(['jquery', 'lib/navigation', 'lib/keyboard', 'lib/showHide', 'lib/timeAgo'], function ($, navigation, keyboard, showHide, timeAgo) {
    $(document).ready(function () {
        keyboard.init();
        showHide.init();
        navigation.init();
        timeAgo.init();
    });
});
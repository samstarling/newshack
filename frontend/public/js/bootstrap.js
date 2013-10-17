require(['jquery', 'lib/navigation', 'lib/keyboard', 'lib/showHide'], function ($, navigation, keyboard, showHide) {
    $(document).ready(function () {
        showHide.init();
        keyboard.init();
        navigation.init();
    });
});
require(['jquery', 'lib/navigation', 'lib/keyboard', 'lib/showHide'], function ($, navigation, keyboard, showHide) {
    $(document).ready(function () {
        keyboard.init();
        showHide.init();
        navigation.init();
    });
});
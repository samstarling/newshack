require(['lib/navigation', 'lib/keyboard', 'jquery', 'lib/showHide'], function (navigation, keyboard, $, showHide) {
    $(document).ready(function () {
        showHide.init();
        keyboard.init();
        navigation.init();
    });
});
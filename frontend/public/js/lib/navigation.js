define(['jquery', 'lib/events'], function ($, events) {
    
    var yItems = document.querySelectorAll('.y'),
        canvas = document.querySelector('.canvas'),
        activeY = 0,
        activeX = 0;

    function updateXClasses() {
        var activeYItem = yItems[activeY],
            xItems = activeYItem.querySelectorAll('.x'),
            activeXItem = xItems[activeX];

        if (xItems.length > 0) {
            $('.x.active').removeClass('active');
            $(activeXItem).addClass('active');
        }
    }

    function setActiveX(x) {
        activeX = x;
        updateStatus();
    }

    function setActiveY(y) {
        activeY = y;
        updateStatus();
    }

    function moveCanvasTo(y) {
        canvas.style.top = '-' + y + 'px';
    }

    function moveXContentTo(yIndex, x) {
        if (yItems[yIndex].querySelector('.event-content')) {
            yItems[yIndex].querySelector('.event-content').style.left = '-' + x + 'px';
        }
    }

    function nextY() {
        var nextYIndex = activeY + 1,
            yItemTop;

        if (nextYIndex < yItems.length) {
            yItemTop = yItems[nextYIndex].offsetTop;
            moveCanvasTo(yItemTop);
            moveXContentTo(activeY, 0);
            setActiveY(activeY + 1);
            setActiveX(0);
            updateXClasses();
        }
    }

    function previousY() {
        var previousYIndex = activeY - 1,
            yItemTop;

        if (previousYIndex >= 0) {
            yItemTop = yItems[previousYIndex].offsetTop;
            moveCanvasTo(yItemTop);
            setActiveX(0);
            moveXContentTo(activeY, 0);
            setActiveY(activeY - 1);
            updateXClasses();
        }
    }

    function nextX() {
        var yItem = yItems[activeY],
            xItems = yItem.querySelectorAll('.x'),
            yItemTop,
            xItemLeft;

        if (xItems.length > 1 && (activeX + 1) < xItems.length) {
            yItemTop = yItems[activeY].offsetTop;
            xItemLeft = xItems[activeX + 1].offsetLeft;
            moveXContentTo(activeY, xItemLeft);
            setActiveX(activeX + 1);
            updateXClasses();
        }
    }

    function previousX() {
        var yItem = yItems[activeY],
            xItems = yItem.querySelectorAll('.x'),
            yItemTop,
            xItemLeft;

        if (xItems.length > 1 && (activeX - 1) >= 0) {
            yItemTop = yItems[activeY].offsetTop;
            xItemLeft = xItems[activeX - 1].offsetLeft;
            moveXContentTo(activeY, xItemLeft);
            setActiveX(activeX - 1);
            updateXClasses();
        }
    }

    function updateStatus() {
        var statusIcons = document.querySelectorAll('.status-circle');

        for (var i = 0, len = statusIcons.length; i < len; i++) {
            statusIcons[i].className = 'status-circle';
        }

        statusIcons[activeY].className = 'status-circle active';

        for (var i = 0, len = yItems.length; i < len; i++) {
            yItems[i].className = 'y event';
        }

        yItems[activeY].className = 'y event active';
    }

    function bindEvents() {
        events.moveRight.add(nextX);
        events.moveLeft.add(previousX);
        events.moveUp.add(previousY);
        events.moveDown.add(nextY);
    }

    function scrollToBottom() {
        setActiveY(yItems.length - 1);
        $(canvas).addClass('slow');
        moveCanvasTo(yItems[activeY].offsetTop);
        updateXClasses();
        setTimeout(function () {
            $(canvas).removeClass('slow');
        }, 1000);
    }

    return {
        init: function () {
            bindEvents();
        },
        scrollToBottom: scrollToBottom
    };
});
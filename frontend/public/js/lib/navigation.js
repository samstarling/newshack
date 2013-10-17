define(['jquery', 'lib/events'], function ($, events) {
    
    var yItems = document.querySelectorAll('.y'),
        canvas = document.querySelector('.canvas'),
        activeY = 0,
        activeX = 0;

    function setActiveX(x) {
        activeX = x;
        updateStatus();
    }

    function setActiveY(y) {
        activeY = y;
        updateStatus();
    }

    function moveCanvasTo(x, y) {
        canvas.style.top = '-' + y + 'px';
        canvas.style.left = '-' + x + 'px';
    }

    function nextY() {
        var nextYIndex = activeY + 1,
            yItemTop;

        if (nextYIndex < yItems.length) {
            yItemTop = yItems[nextYIndex].offsetTop;
            moveCanvasTo(0, yItemTop);
            setActiveY(activeY + 1);
            setActiveX(0);
        }
    }

    function previousY() {
        var previousYIndex = activeY - 1,
            yItemTop;

        if (previousYIndex >= 0) {
            yItemTop = yItems[previousYIndex].offsetTop;
            moveCanvasTo(0, yItemTop);
            setActiveY(activeY - 1);
            setActiveX(0);
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

            moveCanvasTo(xItemLeft, yItemTop);
            setActiveX(activeX + 1);
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

            moveCanvasTo(xItemLeft, yItemTop);
            setActiveX(activeX - 1);
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

    return {
        init: function () {
            bindEvents();
        }
    };
});
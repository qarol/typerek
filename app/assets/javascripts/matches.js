(function () {
    $(function () {
        return $('.clickable-row').click(function () {
            return window.document.location = $(this).data('href');
        });
    });
}).call(this);

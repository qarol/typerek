// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "jquery"
import "jquery_ujs"
import "bootstrap"

$(function () {
    $('.clickable-row').click(function () {
        window.document.location = $(this).data('href');
    });
});

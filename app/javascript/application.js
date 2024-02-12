// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "jquery";
import "bootstrap"
import Rails from "@rails/ujs";

Rails.start();

$(document).ready(function () {
    $('.clickable-row').click(function () {
        window.location.href = $(this).data('href');
    });
});

import "./src/jquery"
import * as bootstrap from 'bootstrap-sass'
import Rails from '@rails/ujs';

Rails.start();

$(function () {
    $(".clickable-row").click(function () {
        window.document.location = $(this).data("href");
    })
});

import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

$('#form-tags').ready(function () {
    $('#form-tags').select2({
        closeOnSelect: false
    })
});


window.onload = function () {
    $('#form-tags').select2({
        closeOnSelect: false
    })
};

import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

/*
$(".js-source-states").select2({
    tags: true
});
*/
  
setTimeout(function(){
    $('.js-source-states').select2({
        tags: true
      })
});

/*
$('.posts.index').ready(function () {
    $('.js-source-states').select2({
        tags: true
      })
});

window.addEventListener('DOMContentLoaded', () => {
  $('.js-source-states').select2({
    tags: true
  })
})*/
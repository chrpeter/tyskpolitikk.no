# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  tinyMCE.remove()
  tinyMCE.init
    selector: 'textarea.tinymce',
    plugins: "image",
  $('.toggle-menu').on 'click', ->
    $('.ui.labeled.icon.sidebar').sidebar('toggle')


  menu = $('#top-menu')
  top_photo = $('#frontpage-header')
  $(window).on 'scroll', ->
    scroll = $(window).scrollTop();
    positionNav = scroll-(top_photo.height())
    if positionNav >= 0
      menu.addClass('navbar-fixed-top')
    else
      menu.removeClass('navbar-fixed-top')



$(document).on 'turbolinks:load', ->


  $('#scroll-to-articles').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#articles-section").offset().top
    }, 1000)

  $('#scroll-to-socialmedia').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#social-media").offset().top
    }, 1000)

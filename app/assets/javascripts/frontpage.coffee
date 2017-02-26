# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  tinyMCE.remove()
  tinyMCE.PluginManager.add 'tweet', (editor, url) ->
    editor.addMenuItem 'tweet',
      text: 'Insert tweet'
      context: 'insert'
      onclick: ->
        editor.windowManager.open
          title: 'Insert tweet'
          body: [ {
            type: 'textbox'
            name: 'tweeturl'
            label: 'Message'
          } ]
          onsubmit: (e) ->
            console.log(e.data.tweeturl)
            editor.insertContent "<div class='tweet'>#{e.data.tweeturl}</div>"
            # Insert content when the window form is submitted
            # editor.insertContent '<blockquote> ' + e.data.message + ' @yourname <footer><a href="https://twitter.com/intent/tweet?text=' + encodeURI(e.data.message) + '%20@yourname" target="_blank" rel="nofollow">Tweet This</a></footer></blockquote>'
            return
        return
    return
  tinyMCE.init
    selector: 'textarea.tinymce',
    plugins: "image link tweet fullpage",
    extended_valid_elements : "a[class|name|href|target|title|onclick|rel],script[type|src],iframe[src|style|width|height|scrolling|marginwidth|marginheight|frameborder],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],$elements",
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

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
            editor.insertContent "<div class='tweet'>#{e.data.tweeturl}</div>"
            return
        return
    return
  tinyMCE.init
    selector: 'textarea.tinymce',
    plugins: "image link tweet fullpage",
    extended_valid_elements : "a[class|name|href|target|title|onclick|rel],script[type|src],iframe[src|style|width|height|scrolling|marginwidth|marginheight|frameborder],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],$elements",
    toolbar: "undo redo pastetext alignleft aligncenter alignright alignjustify image link | bold italic | styleselect | fontselect | fontsizeselect",
    fontsize_formats: '8pt 9pt 10pt 11pt 12pt 13pt 14pt 18pt 24pt 36pt'
    relative_urls : false,
    image_title: true,
    image_description: false,
    automatic_uploads: true,
    remove_script_host : false,
    file_picker_types: 'image',
    file_picker_callback: (cb, value, meta) ->
      input = document.createElement('input')
      input.setAttribute 'type', 'file'
      input.setAttribute 'accept', 'image/*'
      input.onchange = ->
        file = @files[0]
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = ->
          id = 'blobid' + (new Date).getTime()
          blobCache = tinymce.activeEditor.editorUpload.blobCache
          blobInfo = blobCache.create(id, file, reader.result)
          blobCache.add blobInfo
          cb blobInfo.blobUri(), title: file.name
          return
        return
      input.click()
      return
    images_upload_handler: (blobInfo, success, failure) ->
      xhr = undefined
      formData = undefined
      xhr = new XMLHttpRequest
      xhr.withCredentials = false
      xhr.open 'POST', window.location.origin + '/admin/images'
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name="csrf-token"]').attr('content'));
      xhr.onload = ->
        json = undefined
        if xhr.status != 200
          failure 'HTTP Error: ' + xhr.status
          return
        json = JSON.parse(xhr.responseText)
        if !json or typeof json.image.url != 'string'
          failure 'Invalid JSON: ' + xhr.responseText
          return
        success json.image.url
        return
      formData = new FormData
      formData.append 'image_file', blobInfo.blob(), blobInfo.filename()
      xhr.send formData
      return

  $('.toggle-menu').on 'click', ->
    $('.ui.labeled.icon.sidebar').sidebar('toggle')




$(document).on 'turbolinks:load', ->
  $('#scroll-to-articles').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#articles-section").offset().top
    }, 1000)

  $('#scroll-to-socialmedia').on 'click', ->
    $('html, body').animate({
        scrollTop: $("#social-media").offset().top
    }, 1000)

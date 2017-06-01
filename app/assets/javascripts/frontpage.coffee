# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  tinyMCE.remove()
  console.log(window.location)
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
            # Insert content when the window form is submitted
            # editor.insertContent '<blockquote> ' + e.data.message + ' @yourname <footer><a href="https://twitter.com/intent/tweet?text=' + encodeURI(e.data.message) + '%20@yourname" target="_blank" rel="nofollow">Tweet This</a></footer></blockquote>'
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
    automatic_uploads: true,
    remove_script_host : false,
    file_picker_types: 'image',
    images_upload_handler: (blobInfo, success, failure) ->
      xhr = undefined
      formData = undefined
      xhr = new XMLHttpRequest
      xhr.withCredentials = false
      xhr.open 'POST', window.location.origin + '/admin/images'

      xhr.onload = ->
        json = undefined
        if xhr.status != 200
          failure 'HTTP Error: ' + xhr.status
          return
        json = JSON.parse(xhr.responseText)
        if !json or typeof json.location != 'string'
          failure 'Invalid JSON: ' + xhr.responseText
          return
        success json.location
        return

      formData = new FormData
      formData.append 'file', blobInfo.blob(), blobInfo.filename()
      xhr.send formData
      return
    file_picker_callback: (cb, value, meta) ->
      input = document.createElement('input')
      input.setAttribute 'type', 'file'
      input.setAttribute 'accept', 'image/*'
      console.log(window.location)
      # Note: In modern browsers input[type="file"] is functional without
      # even adding it to the DOM, but that might not be the case in some older
      # or quirky browsers like IE, so you might want to add it to the DOM
      # just in case, and visually hide it. And do not forget do remove it
      # once you do not need it anymore.

      input.onchange = ->
        file = @files[0]
        reader = new FileReader
        reader.readAsDataURL file

        reader.onload = ->
          # Note: Now we need to register the blob in TinyMCEs image blob
          # registry. In the next release this part hopefully won't be
          # necessary, as we are looking to handle it internally.
          id = 'blobid' + (new Date).getTime()
          blobCache = tinymce.activeEditor.editorUpload.blobCache
          blobInfo = blobCache.create(id, file, reader.result)
          blobCache.add blobInfo
          # call the callback and populate the Title field with the file name
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
      console.log("YOrgrgrg")

      xhr.onload = ->
        json = undefined
        if xhr.status != 200
          failure 'HTTP Error: ' + xhr.status
          return
        json = JSON.parse(xhr.responseText)
        if !json or typeof json.location != 'string'
          failure 'Invalid JSON: ' + xhr.responseText
          return
        success json.location
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

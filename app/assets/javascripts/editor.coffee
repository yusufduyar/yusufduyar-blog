
$(document).on "turbolinks:load", ->
  $(".edit_article").on("ajax:success", (e, data, status, xhr) ->
    alert('success')
  ).on "ajax:error", (e, xhr, status, error) ->
    alert('error')
#  $('.save-article-button').click (event) ->
#    event.preventDefault();
#
#    $('form.edit_article').submit ->
#      valuesToSubmit = $(this).serialize()
#      console.log(valuesToSubmit)
#      false
#      $.ajax $(this).attr('action'),
#        type: 'POST'
#        dataType: 'JSON'
#        data: valuesToSubmit
#        success: (data, textStatus, jqXHR) ->
#          alert('successfully saved')
#        error: (jqXHR, textStatus, errorThrown) ->
#          alert('error :'+ textStatus)
#      false

#    alert($(this).parents('form')[0].action);
#    checked_categories =$('input[id^="article_category_ids_"].check_box:checked');
#    title = $('#article_title').val();
#    text = CKEDITOR.instances["article_text"].getData();
#
#    $.ajax({
#      url: $("#article_title").parents('form')[0].action,
#      headers: {
#        Accept : "text/javascript; charset=utf-8",
#        "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
#      },
#      type: 'POST',
#      data: {
#        'id': $(this).siblings('[id*=edit_article_]').val(),
#        'authenticity_token': $(this).siblings('#authenticity_token').val(),
#        'title' : title,
#        'text' : text
#      }
#    })